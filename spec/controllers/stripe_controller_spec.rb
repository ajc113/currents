require 'rails_helper'

RSpec.describe StripeController, type: :controller do

  describe "customer.subscription.deleted" do
    let(:payload) { File.read("spec/support/stripe/evt_customer_subscription_deleted.json") }
    it "is successful" do
      expect(Thread).to receive(:new).and_yield
      expect{post :events, payload}.not_to raise_error
    end
  end

  describe "customer.created" do
    let(:payload) { File.read("spec/support/stripe/evt_customer_created.json") }
    it "is successful" do
      expect(Thread).to receive(:new).and_yield
      expect{post :events, payload}.not_to raise_error
    end
  end

  describe "customer.subscription.updated" do
    let(:payload) { File.read("spec/support/stripe/evt_customer_subscription_updated.json") }
    it "is successful" do
      expect(Thread).to receive(:new).and_yield
      expect{post :events, payload}.not_to raise_error
    end
  end

  describe "customer.subscription.updated" do
    let(:payload) { File.read("spec/support/stripe/evt_customer_subscription_updated_2.json") }
    it "is successful" do
      expect(Thread).to receive(:new).and_yield
      expect{post :events, payload}.not_to raise_error
    end
  end

  describe "payout.paid" do
    let(:payload) { File.read("spec/support/stripe/evt_payout_paid.json") }
    it "is successful" do
      expect(Thread).to receive(:new).and_yield
      expect{post :events, payload}.not_to raise_error
    end
  end
end
