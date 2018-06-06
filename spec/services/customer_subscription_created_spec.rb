require 'rails_helper'

RSpec.describe CustomerSubscriptionCreated, type: :service do
  it "is successful" do
    user = create(:user, stripe_customer_id: "cus_dummy_stripe", payment_source: "abc_payment_source")
    payload = File.read "spec/support/stripe/evt_customer_subscription_created.json"
    event = Stripe::Event.construct_from(JSON.parse(payload, symoblize_names: true))
    subject.call(event)
  end
end
