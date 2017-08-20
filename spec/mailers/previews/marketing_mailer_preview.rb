# Preview all emails at http://localhost:3000/rails/mailers/marketing_mailer
class MarketingMailerPreview < ActionMailer::Preview
  def trial_benefits
    MarketingMailer.trial_benefits User.first
  end

  def subscription_reminder
    MarketingMailer.subscription_reminder User.first
  end
end
