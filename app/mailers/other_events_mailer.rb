class OtherEventsMailer < ApplicationMailer
  default from: 'other_events@thefishing.network'
  default to: 'tannakartikey@gmail.com'

  def notify(event)
    @event = event
    event = JSON.parse(event)
    mail(subject: "Event from Stripe not handled - #{event['type']}")
  end
end
