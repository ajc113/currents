class AdminMailer < ApplicationMailer
	default from: "no_reply@thefishing.network"
	#default to: "currentsfishingnetwork@gmail.com"
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

		# def new_report(report)
		# 	@report = report
		# 	template_name = "new-report"
		# 	message = {
		# 		to: [{email: "currentsfishingnetwork@gmail.com"}],
		# 		subject: "New Report",
		# 		merge_vars: [
		# 			{rcpt: "currentsfishingnetwork@gmail.com",
		# 			 vars: [
		# 			 	{name: "REPORTNEW", content: report.location.short_name},
		# 			 	{name: "REPORTSUMMARY", content: report.trip_summary},
		# 			 		]
		# 				}
		# 	      ]
		# 	    }
		# 	    mandrill_client.message.send_template template_name, message
		# 	 end

end
