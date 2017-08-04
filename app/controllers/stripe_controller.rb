class StripeController < ApplicationController
  protect_from_forgery :except => :events
  @endpoint_secret = 'whsec_OtNLhY3vJSQrx1vRinEJ1iRL6FZ7Am1w'

  def events
    request.body.rewind
    payload = JSON.parse(request.body.read)
    sig_header = request.headers["Stripe-Signature"]
    puts "request header is = "
    puts request.headers["Stripe-Signature"]
    event = nil
    event_id = payload["id"]
    event = Stripe::Event.retrieve(event_id) #so that we know event is valid and from Stripe
    customer = event["data"]["object"]["customer"]
    user = User.find_by(stripe_customer_id: customer)
    event_type = event["type"]

    case event_type
    when "charge.failed"

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
      if event.data.object.status == "active" && event.data.previous_attributes.status == "trialing" && user.payment_source == nil
        user.is_active = false
        user.save!
        SubscriptionMailer.delay.customer_subscription_updated(user)
      else
        SubscriptionMailer.delay.trial_over(user)
      end
      #to capture subscription failure

    when "invoice.upcoming"
      #if source added, notify customer about upcoming payment deduction

    when "invoice.created"
      #if trial ends but user does not have payment source

    when "invoice.updated"
      event.previous_attributes.attempt_count >= 0
      next_attempt = event.previous_attributes.next_payment_attempt

    when "invoice.payment_failed"

    when "invoice.payment_succeeded"
      user.is_active = true
      user.save!

    when "customer.source.updated"
      #update user when credit card information is changed
    when "charge.succeeded"
      #inform the user about the charge
    end
    render nothing: true
  end
end
