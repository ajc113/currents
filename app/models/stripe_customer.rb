class StripeCustomer
    
  def self.create(user)
    customer = Stripe::Customer.create(email: user.email)
    user.stripe_customer_id = customer.id
    user.save!
  end
  
  def self.retrieve(customer_id)
    Stripe::Customer.retrieve(customer_id)
  end

  def self.delete(customer_id)
    self.retrieve(customer_id).delete
  end

  def self.payment_source(customer_id)
    self.retrieve(customer_id).default_source
  end

  def self.delete_all_sources(user)
    customer = self.retrieve(user)
    customer.sources.each do |source|
      source.delete
    end
    user.payment_source = nil
    user.save!
  end
  
end
