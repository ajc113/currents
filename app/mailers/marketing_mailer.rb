class MarketingMailer < ApplicationMailer
  default from: 'no-reply@thefishing.network'
  def trial_benefits user
    @user = user
    mail(to: user.email, subject: 'Currents Network | Use premeium features for free until trial ends')
  end

  def subscription user
  end
end
