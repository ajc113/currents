require 'rails_helper'

RSpec.describe CustomerSubscriptionTrialWillEnd, type: :service do
  it "#process" do
    user = create(:user, payment_source: "abc_payment_source")
    payload = File.read "spec/support/stripe/evt_customer_subscription_trial_will_end.json"
    event = Stripe::Event.construct_from(JSON.parse(payload, symoblize_names: true))
    subject.call(event)
  end
end
