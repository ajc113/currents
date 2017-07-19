class StripeSubscription

  def self.create(user)
    subscription = Stripe::Subscription.create(
                      :customer  => user.stripe_customer_id,
                      :plan      => 'monthly',
                      :trial_end => (Date.today + 31).to_time.to_i 
                    )
    user.subscription_id = subscription.id
    user.save!
  end

  def self.retrieve(subscription_id)
    Stripe::Subscription.retrieve(subscription_id)
  end

  def self.delete(subscription_id)
    self.retrieve(subscription_id).delete
  end
end
