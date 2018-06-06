class CustomerSourceCreated
  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    source = event.data.object.last4
    SubscriptionMailer.delay.customer_source_created(user, source)
  end
end
