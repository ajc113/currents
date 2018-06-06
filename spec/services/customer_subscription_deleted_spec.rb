require 'rails_helper'

RSpec.describe CustomerSubscriptionDeleted, type: :service do
  it "#call" do
    payload = File.read "spec/support/stripe/evt_customer_subscription_deleted.json"
    event = Stripe::Event.construct_from(JSON.parse(payload, symoblize_names: true))
    subject.call(event)
  end
end
