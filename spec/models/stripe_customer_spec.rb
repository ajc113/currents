require 'rails_helper'

RSpec.describe StripeCustomer do
  it "creates stripe customer" do
    user = build(:user)
    StripeCustomer.create(user)
    expect(user.stripe_customer_id).to eq("cus_1CXxPJDpw1VLvJ")
  end

  context "customer retrieve" do
    it 'creates issue if customer does not exist' do
      allow(GithubIssues).to receive(:create)
      StripeCustomer.retrieve(build(:non_customer))
      expect(GithubIssues).to have_received(:create).once
    end

    it 'retrieves the customer from stripe' do
      customer = StripeCustomer.retrieve(build(:stripe_customer))
      expect(customer.id).to eq('cus_1CXxPJDpw1VLvJ')
    end
  end

  it "deletes the customer" do
    user = build(:stripe_customer)
    customer = StripeCustomer.retrieve(user)
    allow(Stripe::Customer).to receive(:retrieve).and_return(customer)
    allow(customer).to receive(:delete)
    StripeCustomer.delete(user)
    expect(Stripe::Customer).to have_received(:retrieve).with("cus_1CXxPJDpw1VLvJ")
    expect(customer).to have_received(:delete)
    expect(user.stripe_customer_id).to be_empty
  end

  it "gets the default payment source" do
    user = build(:stripe_customer)
    customer = StripeCustomer.retrieve(user)
    payment_source = StripeCustomer.payment_source(user)
    expect(payment_source).to eq("src_1BDT3BLl1LzrhllYSAFu2MMu")
  end

  it "deletes the payment source of a customer" do
    user = build(:stripe_customer)
    StripeCustomer.delete_all_sources(user)
    expect(user.payment_source).to be_nil
  end

  it "replaces the default source of a stripe customer" do
    user = build(:stripe_customer)
    StripeCustomer.save_source(user, FakeStripe::SOURCE)
    expect(user.payment_source).to eq("src_abcdefghijkl")
  end
end
