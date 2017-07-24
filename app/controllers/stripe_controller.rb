class StripeController < ApplicationController
  protect_from_forgery :except => :events

  def events
    request.body.rewind
    event_payload = JSON.parse(request.body.read)
    event_id = event_payload["id"]
    @event = Stripe::Event.retrieve(event_id) #so that we know event is valid and from Stripe
    @customer = @event["data"]["object"]["customer"]
    @user = User.find_by(stripe_customer_id: @customer)
    @event_type = @event["type"]

    case @event_type
    when "charge.failed"

    when "customer.subscription.trial_will_end"
      #triggers three days before trial going to add
      #reming the user by email to add payment source
      TrialEnd.notify_user(@user).deliver

    when "customer.subscription.deleted"
      #after three failed payment attempts as per the settings subscription will be deleted
      @user.subscription_id = nil
      @user.is_active = false
      @user.save!
      StripeCustomer.delete_all_sources(@user)

    when "customer.subscription.updated"
      #to capture subscription from trial to active
      if @event.data.object.status == "active" && @event.data.previous_attributes.status == "trialing" && @user.payment_source == nil
        @user.is_active = false
        @user.save!
      end
      #to capture subscription failure

    when "invoice.upcoming"
      #if source added, notify customer about upcoming payment deduction

    when "invoice.created"
      #if trial ends but user does not have payment source

    when "invoice.updated"

    when "invoice.payment_failed"

    when "invoice.payment_succeeded"
      @user.is_active = true
      @user.save!
    end
    render nothing: true
  end
end
