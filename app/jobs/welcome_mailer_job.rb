class WelcomeMailerJob < ActiveJob::Base
  queue_as :default

 def perform(welcome)
    DeviseCustomMailer.welcome_mailer.updated_user(user)
  end
  handle_asynchronously :in_the_future, :run_at => Proc.new { 5.minutes.from_now }
end


