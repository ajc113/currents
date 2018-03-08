class MarketingMailer < ApplicationMailer
  default from: 'no-reply@thefishing.network'
  def trial_benefits user
    @user = user
    mail(to: user.email, subject: 'Currents Network | Use premeium features for free until trial ends')
  end

  def subscription_reminder user
    @user = user
    mail(to: user.email, subject: 'Currents Network | Tap into the premiere northeast fishing network intel for just $9 a month')
  end
end
