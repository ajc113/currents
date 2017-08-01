# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def new_user
    AdminMailer.new_user(User.first)
  end

  def new_report
    AdminMailer.new_report(Report.first)
  end

end
