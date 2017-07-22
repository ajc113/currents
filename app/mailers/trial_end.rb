class TrialEnd < ApplicationMailer
  def notify_user(user)
    @user = user
    @url = 'https://#{HOST}/cards/new'
    mail(to: @user.email, subject: "Currents | Your trial is going to end")
  end
end
