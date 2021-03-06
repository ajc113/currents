class StripeSubscription
  def self.create(user, trial_end = 'now')
    subscription = Stripe::Subscription.create(
      :customer  => user.stripe_customer_id,
      :plan      => 'monthly',
      :trial_end => trial_end,
      :metadata  => { "automatic" => true }
    )
    user.subscription_id = subscription.id
    user.is_active = true
    user.save!
  end

  def self.retrieve(user)
    Stripe::Subscription.retrieve(user.subscription_id) unless user.subscription_id.nil?
  end

  def self.delete(user)
    self.retrieve(user).delete
    user.subscription_id = nil
    user.is_active = false
    user.save!
    StripeCustomer.delay.delete_all_sources(user)
  end

  def self.is_active? (user)
    unless user.subscription_id.nil?
      StripeCustomer.retrieve(user).subscriptions.total_count == 0 ? false : true
    else
      false
    end
  end

  extend ExceptionWrapper
end
