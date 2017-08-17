require 'delayed_job'
namespace :marketing_mailer do
  desc "sends marketing emails to users"

  task :trial_benefits => :environment do
    users = User.where('DATE(created_at) = ? AND sign_in_count < ?', Date.today - 15, 3)
    users.each { |user| MarketingMailer.trial_benefits(user).deliver }
  end

  task :subscription => :environment do
  end

end
