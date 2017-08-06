class DeviseCustomMailer < Devise::Mailer
	helper :application
	default template_path: 'devise/mailer'
	layout 'mailer'
	# add_template_helper EmailHelper
	add_template_helper ApplicationHelper
	default from: 'Fishing Network <intel@thefishing.network>'
  default to: "tannakartikey@gmail.com"

	require "mandrill"

  def confirmation_instructions(user, token, opts={})
    @username = user.first_name || user.email
    @confirmation_link = "http://" + ENV['HOST'] + "/users/confirmation/confirmation_token=" + token
    mail(to: user.email, subject: 'Account confirmation')
  end

	#def mandrill_template(template_name, attributes)
		#mandrill = Mandrill::API.new(ENV['MANDRILL_API_KEY'])

		#merge_vars = attributes.map do |key, value|
			#{ name: key, content: value }
		#end

		#private

		#def confirmation_instructions(record, token, opts={})
			#template_name = "registration"
			#template_content = []
			#message = {
				#to: [{email: user.email}],
				#subject: "Hellow",
				## subject: "Account Confirmation",
				#merge_vars: [
					#{rcpt: "email: user.email",
						#vars: [
							#{name: "USER_NAME", content: @email}
							## {name: "ACCOUNT_CONFIRMATION_LINK", content: "http://localhost:3000/users/confirmation?confirmation_token=#{token}"}
						#]
					#}
				#]
			#}
		#end    
		#mandrill_template.messages.send_template registration, template_content, message
	#end

	#def send_mail(email, subject, body)
		#mail(to: email, subject: subject, body: body, content_type: "text/html")
	#end

end
