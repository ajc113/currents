# Preview all emails at http://localhost:3000/rails/mailers/trial_end
class SubscriptionMailerPreview < ActionMailer::Preview
  def customer_subscription_trial_will_end
    SubscriptionMailer.customer_subscription_trial_will_end(User.first)
  end
end
