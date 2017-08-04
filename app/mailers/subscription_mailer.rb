class SubscriptionMailer < ApplicationMailer

  default from: 'intel@thefishing.network'


  def customer_subscription_trial_will_end(user)
    @user = user
    mail(to: @user.email, subject: "Currents Network | Your trial period is going to end")
  end
  
  def charge_failed
  end

  def customer_subscription_deleted(user)
    @user = user
    mail(to: @user.email, subject: "Currents Network | Subscription is cancelled")
  end

  def customer_subscription_updated(user)
    @user = user
    mail(to: @user.email, subject: "Currents Network | Your trial period has ended")
  end

  def trial_over(user)
    @user = user
    mail(to: @user.email, subject: "Currents Network | Your trial period has ended")
  end

  def invoice_created
  end

end
