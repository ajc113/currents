class CustomerSubscriptionDeleted
  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    if user
      user.subscription_id = nil
      user.is_active = false
      user.save!
      StripeCustomer.delete_all_sources(user)
      SubscriptionMailer.delay.customer_subscription_deleted(user)
    end
  end
end
