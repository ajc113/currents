class StripeCustomer
  def initialize(user)
    @user = user
  end

  def self.new(user)
    customer = Stripe::Customer.create(email: user.email)
    user.stripe_customer_id = customer.id
    user.save!
  end

  def self.subscribe(user)
    Stripe::Subscription.create(
      :customer  => user.stripe_customer_id,
      :plan      => 'monthly',
      :trial_end => (Date.today + 31).to_time.to_i 
    )
  end
end
