require 'delayed_job'
namespace :marketing_mailer do
  desc "sends marketing emails to users"

  task :trial_benefits => :environment do
    users = User.where('DATE(created_at) = ? AND sign_in_count < ?', Date.today - 14, 3)
    users.each { |user| MarketingMailer.delay.trial_benefits(user) }
  end

  task :subscription_reminder => :environment do
    users = User.where('DATE(created_at) = ? AND subscription_id IS ?', Date.today-45, nil)
    users.each { |user| MarketingMailer.delay.subscription_reminder(user) }
  end

end
