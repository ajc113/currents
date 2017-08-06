class AdminMailer < ApplicationMailer
	default from: "no_reply@thefishing.network"
	default to: "currentsfishingnetwork@gmail.com"
	# default to: "tannakartikey@gmail.com"

	def new_user(user)
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
