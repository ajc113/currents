class StripeSubscription

  def self.create(user, trial_end = 'now')
    subscription = Stripe::Subscription.create(
                      :customer  => user.stripe_customer_id,
                      :plan      => 'monthly',
                      :trial_end => trial_end
                    )
    user.subscription_id = subscription.id
    user.save!
  end

  def self.retrieve(user)
    Stripe::Subscription.retrieve(user.subscription_id)
  end

  def self.delete(user)
    self.retrieve(user.subscription_id).delete
    user.subscription_id = nil
    user.is_active = false
    user.save!
  end

  def self.is_active? (user)
    StripeCustomer.retrieve(user.customer_id).subscriptions.total_count == 0 ? false : true
  end
end
