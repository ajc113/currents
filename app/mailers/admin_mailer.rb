class AdminMailer < ApplicationMailer
	default from: "no_reply@thefishing.network"
	default to: "currentsfishingnetwork@gmail.com"

	def new_user(user)
		@user = user
		mail(subject: "New User: #{user.email}")
	end

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
	
		merge_vars = attributes.map do |key, value|
      { name: key, content: value }

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

	def new_report(report)
		@report = report
		mail(subject: "New Report: #{report.location.short_name}")
	end

end
