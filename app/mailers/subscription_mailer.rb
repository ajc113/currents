class SubscriptionMailer < ActionMailer::Base

  default from: 'intel@thefishing.network'

  def customer_subscription_trial_will_end(user)
    @user = user
    mail(to: @user.email, subject: subject("Your trial period is going to end"))
  end

  def customer_subscription_deleted(user)
    @user = user
    mail(to: @user.email, subject: subject("Subscription is cancelled"))
  end

  def customer_subscription_updated(user)
    @user = user
    mail(to: @user.email, subject: subject("Your trial period has ended"))
  end

  def trial_over(user)
    @user = user
    mail(to: @user.email, subject: subject("Your trial period has ended"))
  end

  def invoice_upcoming(user)
    @user = user
    mail(to: @user.email, subject: subject("Invoice will be created in three days"))
  end

  def invoice_created
  end

  def invoice_updated
  end

  def invoice_payment_failed
  end

  def invoice_payment_succeeded
  end
  
  def customer_source_updated(user)
    @user = user
    mail(to: @user.email, subject: subject("Your payment source was updated"))
  end

  private
  
  def subject(subject)
    "Currents Network | " + subject.titlecase
  end

end
