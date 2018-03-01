class DeviseCustomMailer < Devise::Mailer
  helper :application
  default template_path: 'devise/mailer'
  include Devise::Controllers::UrlHelpers
  #layout 'mailer'
  default from: 'Fishing Network <intel@thefishing.network>'
  default to: "tannakartikey@gmail.com"

  require "mandrill"

  def confirmation_instructions(user, token, opts={})
    @username = user.first_name || user.email
    @confirmation_link = "http://" + ENV['HOST'] + "/users/confirmation?confirmation_token=" + token
    mandrill = Mandrill::API.new ENV['MANDRILL_API_KEY']
    template_name = "registration"
    template_content = []
    merge_vars = [{"content"=> @username, "name"=>"USER_NAME"}, {"content"=> @confirmation_link, "name"=>"ACCOUNT_CONFIRMATION_LINK"}]
    @result = (mandrill.templates.render template_name, template_content, merge_vars)['html']
    mail(to: user.email, subject: 'Account confirmation', content_type: 'text/html')
  end
end
