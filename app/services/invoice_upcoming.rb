class InvoiceUpcoming
  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    unless event.data.object.total == 0
      SubscriptionMailer.delay.invoice_upcoming(user)
    end
  end
end
