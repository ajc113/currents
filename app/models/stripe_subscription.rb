class StripeSubscription
  
  def self.exception_handler(data, &block)
    yield
  rescue => error
    GithubIssues.create(error, self.name, caller_locations(2,2)[0].label, data)
  end

  def self.create(user, trial_end = 'now')
    self.exception_handler(user) do
      subscription = Stripe::Subscription.create(
                      :customer  => user.stripe_customer_id,
                      :plan      => 'monthly',
                      :trial_end => trial_end
                    )
      user.subscription_id = subscription.id
      user.save!
    end
  end

  def self.retrieve(user)
    self.exception_handler(user) { Stripe::Subscription.retrieve(user.subscription_id) }
  end

  def self.delete(user)
    self.retrieve(user).delete
    user.subscription_id = nil
    user.is_active = false
    user.save!
    StripeCustomer.delete_all_sources(user)
  end

  def self.is_active? (user)
    StripeCustomer.retrieve(user.customer_id).subscriptions.total_count == 0 ? false : true
  end
end
