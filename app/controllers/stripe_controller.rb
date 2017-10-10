class StripeController < ApplicationController
  protect_from_forgery :except => :events
  def events
    request.body.rewind
    payload = JSON.parse(request.body.read)
    event = nil
    event_id = payload["id"]
    if Rails.env.production?
      begin
        event = Stripe::Event.retrieve(event_id)  #so that we know event is valid and from Stripe
      rescue => error
        PartyFoul::RacklessExceptionHandler.handle(error, class: self, method: __method__, params: event_id)
      end
    else
      event = JSON.parse(request.body.read, object_class: OpenStruct)
    end
    if event
      Thread.new do
        begin
          customer = event.data.object.customer
          user = User.find_by(stripe_customer_id: customer)
          event_type = event.type
          event_process(event_type, event, user, customer)
        rescue => error
          PartyFoul::RacklessExceptionHandler.handle(error, class: self, method: __method__, params: user.inspect)
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
      StripeCustomer.delete_all_sources(user)
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
      elsif event.data.previous_attributes.trial_end.present?
        user.is_active = true
        user.save!
        trial_end_date = Date.strptime(event.data.object.trial_end.to_s, '%s')
        SubscriptionMailer.delay.trial_extended(user, trial_end_date)
      end

    when "invoice.upcoming"
      #if source added, notify customer about upcoming payment deduction
      unless event.data.object.total == 0
        SubscriptionMailer.delay.invoice_upcoming(user)
      end

    when "invoice.updated"
      if event.previous_attributes.paid == 'false'
        user.is_active = true
        user.save!
        SubscriptionMailer.invoice_payment_succeeded(user).deliver
      end

    when "charge.failed"
      source = event.data.object.source.last4
      error = event.data.object.outcome.seller_message
      SubscriptionMailer.delay.charge_failed(user, source, error)

    when "invoice.payment_failed"
      next_payment_attempt = event.data.object.next_payment_attempt
      unless next_payment_attempt.nil?
        next_payment_attempt = Date.strptime(next_payment_attempt.to_s, '%s')
        SubscriptionMailer.delay.invoice_payment_failed(user, next_payment_attempt)
      end

    when "invoice.payment_succeeded"
      user.is_active = true
      user.save!
      SubscriptionMailer.delay.invoice_payment_succeeded(user)

    when "customer.source.created"
      source = event.data.object.card.last4
      SubscriptionMailer.delay.customer_source_created(user, source)

    when "customer.subscription.created"
      user.subscription_id =  event.data.object.id
      user.is_active = true
      user.save!
      SubscriptionMailer.delay.customer_subscription_created(user) unless event.data.object.metadata.methods(false).include? :automatic

    else
      #Every other event we are not handling
      if Rails.env.development?
        #OtherEventsMailer.delay.notify(request.body.read)
      end
    end
  end
end
