class CustomerSubscriptionTrialWillEnd

  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    event = event
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    SubscriptionMailer.delay.customer_subscription_trial_will_end(user)
  end

end
