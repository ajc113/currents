class SubscriptionMailer < ApplicationMailer

  default from: 'intel@thefishing.network'


  def customer_subscription_trial_will_end(user)
    @user = user
    @url = 'http://' + ENV['HOST'] + '/card/new'
    mail(to: @user.email, subject: "Currents Network | Your trial period is going to end soon")
  end
  
  def charge_failed
  end

  def customer_subscription_deleted
  end

  def customer_subscription_updated
  end

  def invoice_created
  end

end
