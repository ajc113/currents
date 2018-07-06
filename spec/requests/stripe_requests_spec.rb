require 'rails_helper'

RSpec.describe "StripeRequests", type: :request do
  def bypass_event_signature(payload)
    event = Stripe::Event.construct_from(JSON.parse(payload, symbolize_names: true))
    expect(Stripe::Webhook).to receive(:construct_event).and_return(event)
  end




  describe "customer.subscription.trial_will_end" do
    let(:payload) { File.read("spec/support/stripe/evt_customer_subscription_trial_will_end.json") }
    before(:each) { bypass_event_signature payload  }

    it "is successful" do
      post '/stripe_events', body: payload
      expect(response.status).to eq 200
    end
  end

  describe "customer.subscription.deleted" do
    let(:payload) { File.read("spec/support/stripe/evt_customer_subscription_deleted.json") }
    before(:each) { bypass_event_signature payload  }

    it "is successful" do
      post '/stripe_events', body: payload
      expect(response.status).to eq 200
    end
  end
end
