class InvoicePaymentFailed
  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    next_payment_attempt = event.data.object.next_payment_attempt
    unless next_payment_attempt.nil?
      next_payment_attempt = Date.strptime(next_payment_attempt.to_s, '%s')
      SubscriptionMailer.delay.invoice_payment_failed(user, next_payment_attempt)
    end
  end
end
