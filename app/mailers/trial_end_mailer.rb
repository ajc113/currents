class TrialEndMailer < ApplicationMailer
  default from: "intel@thefishing.network"
  def notify_user(user)
    @user = user
    @url = 'http://' + ENV['HOST'] + '/card/new'
    mail(to: @user.email, subject: "Currents Network | Your trial period is going to end soon")
  end
end
