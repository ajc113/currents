class CustomerSubscriptionCreated
  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    user.subscription_id =  event.data.object.id
    user.is_active = true
    user.save!
    SubscriptionMailer.delay.customer_subscription_created(user) unless event.data.object.metadata.methods(false).include? :automatic
  end
end
