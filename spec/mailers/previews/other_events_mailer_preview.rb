class OtherEventsMailerPreview < ActionMailer::Preview
  def notify
    OtherEventsMailer.notify(User.first.as_json)
  end
end
