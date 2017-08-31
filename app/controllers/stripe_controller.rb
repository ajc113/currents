class StripeController < ApplicationController
  protect_from_forgery :except => :events

  def events
    request.body.rewind
    payload = JSON.parse(request.body.read)
    event = nil
    event_id = payload["id"]
    event = begin
              Stripe::Event.retrieve(event_id) unless Rails.env.test? #so that we know event is valid and from Stripe
    rescue => error
      PartyFoul::RacklessExceptionHandler.handle(error, class: self, method: __method__, params: event_id)
    end
    if event
      Thread.new do
        begin
          customer = event["data"]["object"]["customer"]
          user = User.find_by(stripe_customer_id: customer)
          event_type = event["type"]
          event_process(event_type, event, user, customer)
        rescue => error
          PartyFoul::RacklessExceptionHandler.handle(error, class: self, method: __method__, params: user)
        end
        ActiveRecord::Base.connection.close
      end
    end
    render nothing: true, status: 200
  end

  def event_process(event_type, event, user, customer)
    case event_type
    when "customer.subscription.trial_will_end"
      #triggers three days before trial going to add
      #reming the user by email to add payment source
      SubscriptionMailer.delay.customer_subscription_trial_will_end(user)

    when "customer.subscription.deleted"
      #after three failed payment attempts as per the settings subscription will be deleted
      user.subscription_id = nil
      user.is_active = false
      user.save!
      StripeCustomer.delete_all_sources(customer)
      SubscriptionMailer.delay.customer_subscription_deleted(user)

    when "customer.subscription.updated"
      #to capture subscription from trial to active
      if event.data.object.status == "active" && event.data.previous_attributes.status == "trialing" 
        if user.payment_source == nil
          user.is_active = false
          user.save!
          SubscriptionMailer.delay.customer_subscription_updated(user)
        else
          SubscriptionMailer.delay.trial_over(user)
        end
      elsif event.data.object.status == "trialing" && event.data.previous_attributes.status == "active" 
        user.is_active = true
        user.save!
        #trial_end_date = Date.strptime(event.data.trial_end, '%s')
        SubscriptionMailer.delay.trial_extended(user, Date.today)
      end

    when "invoice.upcoming"
      #if source added, notify customer about upcoming payment deduction
      unless event.data.object.total == 0
        SubscriptionMailer.delay.invoice_upcoming(user)
      end

    when "invoice.updated"
      if event.previous_attributes.attempt_count >= 0
        next_attempt = event.previous_attributes.next_payment_attempt
      end

    when "invoice.payment_failed"
      next_payment_attempt = event.data.object.next_payment_attempt
      unless next_payment_attempt.nil?
        next_payment_attempt = Date.strptime(next_payment_attempt, '%s')
        SubscriptionMailer.delay.invoice_payment_failed(user, next_payment_attempt)
      end

    when "invoice.payment_succeeded"
      user.is_active = true
      user.save!
      SubscriptionMailer.delay.invoice_payment_succeeded(user)

    when "customer.source.updated"
      #update user when credit card information is changed
      SubscriptionMailer.delay.customer_source_updated(user)

    else
      #Every other event we are not handling
      #if Rails.env.development?
      #OtherEventsMailer.notify(event).deliver
      #end
    end
  end
end
