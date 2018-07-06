class ChargeFailed

  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    source = event.data.object.source.card.last4
    error = event.data.object.outcome.seller_message
    SubscriptionMailer.delay.charge_failed(user, source, error)
  end
end
