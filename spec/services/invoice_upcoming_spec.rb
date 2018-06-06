require 'rails_helper'

RSpec.describe InvoiceUpcoming, type: :service do
  it "is successful" do
    payload = File.read "spec/support/stripe/evt_invoice_upcoming.json"
    event = Stripe::Event.construct_from(JSON.parse(payload, symoblize_names: true))
    subject.call(event)
  end
end
