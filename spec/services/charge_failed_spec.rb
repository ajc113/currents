require 'rails_helper'

RSpec.describe ChargeFailed, type: :service do
  it 'is successful' do
    payload = File.read "spec/support/stripe/evt_charge_failed.json"
    event = Stripe::Event.construct_from(JSON.parse(payload, symoblize_names: true))
    subject.call(event)
  end
end
