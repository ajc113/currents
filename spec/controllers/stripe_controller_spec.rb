require 'rails_helper'

RSpec.describe StripeController, type: :controller do
    let(:payload) { File.read("spec/support/stripe/evt_customer_subscription_deleted.json") }
  it 'respond to stripe event' do
    expect(Thread).to receive(:new).and_yield
    post :events, payload
    expect(response.status).to eq 200
  end
end
