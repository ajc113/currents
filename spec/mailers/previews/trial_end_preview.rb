# Preview all emails at http://localhost:3000/rails/mailers/trial_end
class TrialEndPreview < ActionMailer::Preview
  def notify_user
    TrialEnd.notify_user(User.first)
  end
end
