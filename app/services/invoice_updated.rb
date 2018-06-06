class InvoiceUpdated
  def call(event)
    @event = event
    puts (@event.type).colorize(:yellow)
    user = User.find_by_stripe_customer_id(event.data.object.customer)
    if event.data.keys.include?("previous_attributes")
      if event.data.previous_attributes.keys.include?("paid")
        if event.previous_attributes.paid == 'false'
          user.is_active = true
          user.save!
          SubscriptionMailer.invoice_payment_succeeded(user).deliver
        end
      end
    end
  end
end
