class DeviseCustomMailerPreview < ActionMailer::Preview
	def confirmation_instructions
    DeviseCustomMailer.confirmation_instructions(User.last, "faketoken", {})
  end
end
