class AdminMailer < ApplicationMailer
  default from: "no_reply@currentsfishing.com"
  default to: AdminEmails.list


  def new_user(user)
    @username = user.first_name || user.email
    @confirmation_link = "http://" + ENV['HOST'] + "/users/confirmation?confirmation_token=" + user.confirmation_token
    @user = user
    mail(subject: "New User: #{user.email}")
  end

  def new_report(report)
    @report = report
    mail(subject: "New Report: #{report.location.short_name}")
  end

  def mandrill_client
    @mandrill_client ||= Mandrill::API.new ENV['MANDRILL_API_KEY']
    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end
  end

end
