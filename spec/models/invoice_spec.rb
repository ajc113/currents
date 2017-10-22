require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it "retrieves all invoices of a customer" do
    invoices = Invoice.stripe_invoices_for_user(build(:user, stripe_customer_id: FakeStripe::CUSTOMER_ID))
    expect(invoices.length).to eq(1)
    expect(invoices.first.id).to eq(FakeStripe::INVOICE_ID)
  end
end
