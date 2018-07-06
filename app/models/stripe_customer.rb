class StripeCustomer

  def self.create(user)
    customer = Stripe::Customer.create(
      email: user.email,
      source: user.payment_source
    )
    user.stripe_customer_id = customer.id
    user.save!
  end

  def self.retrieve(user)
    Stripe::Customer.retrieve(user.stripe_customer_id)
  end

  def self.delete(user)
    self.retrieve(user).delete
    user.stripe_customer_id = "" 
    user.save!
  end

  def self.payment_source(user)
    self.retrieve(user).default_source
  end

  def self.save_source(user, source)
    customer = retrieve(user)
    customer.source = source
    customer.save
    user.payment_source = source
    user.save!
  end

  def self.delete_all_sources(user)
    customer = self.retrieve(user)
    customer.sources.each do |source|
      source.delete
    end
    user.payment_source = nil
    user.save!
  end

  extend ExceptionWrapper
end
