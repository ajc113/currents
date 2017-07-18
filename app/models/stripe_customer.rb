class StripeCustomer
    
  def self.create(user)
    customer = Stripe::Customer.create(email: user.email)
    user.stripe_customer_id = customer.id
    user.save!
  end

  def self.delete(user)
    new.retrieve(user.stripe_customer_id).delete
  end
  
  def self.retrieve(customer_id)
    new.retrieve(customer_id)
  end

  def retrieve(customer_id)
    Stripe::Customer.retrieve(customer_id)
  end

  def self.subscribe(user)
    Stripe::Subscription.create(
      :customer  => user.stripe_customer_id,
      :plan      => 'monthly',
      :trial_end => (Date.today + 31).to_time.to_i 
    )
  end
end
