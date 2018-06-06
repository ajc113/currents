require 'rails_helper'

RSpec.describe CustomerSourceCreated, type: :service do
  it "is successfule" do
    payload = File.read "spec/support/stripe/evt_customer_source_created.json"
    event = Stripe::Event.construct_from(JSON.parse(payload, symoblize_names: true))
    subject.call(event)
  end
end
