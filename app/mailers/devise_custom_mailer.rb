class DeviseCustomMailer < Devise::Mailer

	helper :application
	default template_path: 'devise/mailer'
	layout 'mailer'
	# add_template_helper EmailHelper
	add_template_helper ApplicationHelper
	default from: 'Fishing Network <intel@thefishing.network>'
  default to: "currentsfishingnetwork@gmail.com"

	require "mandrill"

  def confirmation_instructions(user, token, opts={})
    @username = user.first_name || user.email
    @confirmation_link = "http://" + ENV['HOST'] + "/users/confirmation?confirmation_token=" + token
    mail(to: user.email, subject: 'Account confirmation')
  end

	

end

