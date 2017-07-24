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
  
  def self.create_with_trial(user)
    
    user.subscription_id = subscription.id
    user.save!
  end

  def self.retrieve(subscription_id)
    Stripe::Subscription.retrieve(subscription_id)
  end

  def self.delete(user)
    self.retrieve(user.subscription_id).delete
    user.subscription_id = nil
    user.is_active = false
    user.save!
  end

  def self.is_active? (customer_id)
    StripeCustomer.retrieve(customer_id).subscriptions.total_count == 0 ? false : true
  end
end
