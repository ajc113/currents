class InvoicePaymentSucceeded
  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    user.is_active = true
    user.save!
    SubscriptionMailer.delay.invoice_payment_succeeded(user)
  end
end
