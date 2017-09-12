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

  def trial_extended(user, trial_end_date = nil)
    @user = user
    @trial_end_date = trial_end_date
    mail(to: @user.email, subject: subject("Your trial period is extended"))
  end

  def invoice_upcoming(user)
    @user = user
    mail(to: @user.email, subject: subject("Invoice will be created in three days"))
  end

  def invoice_updated(user)
  end

  def charge_failed(user, source = nil, error = nil)
    @user = user
    @source = source
    @error = error
    mail(to: @user.email, subject: subject("We failed to charge your card"))
  end

  def invoice_payment_failed(user, next_payment_attempt = nil)
    @user = user
    @next_payment_attempt = next_payment_attempt
    mail(to: @user.email, subject: subject("We failed to charge your card"))
  end

  def invoice_payment_succeeded(user)
  end
  
  def customer_source_created(user, source=nil)
    @user = user
    @source = source
    mail(to: @user.email, subject: subject("Your payment source was updated"))
  end

  def customer_subscription_created(user)
    @user = user
    mail(to: @user.email, subject: subject("Your subscription at Currents is created"))
  end

  private
  
  def subject(subject)
    "Currents Network | " + subject.titlecase
  end

end
