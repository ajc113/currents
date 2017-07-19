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

  def self.delete(user)
    self.retrieve(user.subscription_id).delete
    user.subscription_id = nil
    user.save!
  end
end
