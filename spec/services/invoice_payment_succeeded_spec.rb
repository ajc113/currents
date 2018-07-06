require 'rails_helper'

RSpec.describe InvoicePaymentSucceeded, type: :service do
  it "is successful" do
    user = create(:user, payment_source: "abc_payment_source")
    payload = File.read "spec/support/stripe/evt_invoice_updated.json"
    event = Stripe::Event.construct_from(JSON.parse(payload, symoblize_names: true))
    subject.call(event)
  end
end
