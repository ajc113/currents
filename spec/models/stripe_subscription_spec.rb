require 'rails_helper'

RSpec.describe StripeSubscription, type: :model do
  it "creates subscription" do
    user = build(:stripe_customer)
    StripeSubscription.create(user)
    expect(user.subscription_id).to eq("sub_4uJxAs8DlW3Z0w")
    expect(user).to be_is_active
  end

  it "retrieves the subscription" do
    user = build(:stripe_customer, subscription_id: FakeStripe::SUBSCRIPTION_ID)
    subscription = StripeSubscription.retrieve(user)
    expect(subscription.id).to eq("sub_4uJxAs8DlW3Z0w")
    expect(subscription.customer).to eq("cus_1CXxPJDpw1VLvJ")
  end

  it "deletes the subscription" do
    user = build(:stripe_customer, subscription_id: FakeStripe::SUBSCRIPTION_ID)
    StripeSubscription.delete(user)
    expect(user.subscription_id).to eq(nil)
    expect(user).not_to be_is_active
  end

  context "#is_active" do
    it "checks if the subscription is active or not" do
      user = build(:stripe_customer, subscription_id: FakeStripe::SUBSCRIPTION_ID)
      result = StripeSubscription.is_active?(user)
      expect(result).to be true
    end

    it "returns false if subscription id is nil" do
      user = build(:stripe_customer)
      result = StripeSubscription.is_active?(user)
      expect(result).to be false
    end
  end
end
