require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it "retrieves all invoices of a customer" do
    invoices = Invoice.find_all_by_user(build(:user, stripe_customer_id: FakeStripe::CUSTOMER_ID))
    expect(invoices.length).to eq(1)
    expect(invoices.first.id).to eq(FakeStripe::INVOICE_ID)
  end

  it 'does not find invoices with a blank customer' do
    expect(Invoice.find_all_by_user(nil).length).to eq 0
  end

  it 'returns the upcoming invoice for a user' do
    upcoming_invoice = Invoice.upcoming(build(:user, stripe_customer_id: FakeStripe::CUSTOMER_ID))
    expect(upcoming_invoice.id).to eq(FakeStripe::INVOICE_ID)
  end

  describe "invoice fields" do
    let(:invoice) { Invoice.new(FakeStripe::INVOICE_ID) }

    it "reutrns the invoice total from stripe" do
      expect(invoice.total).to eq(9)
    end

    it "returnes the user who matches the stripe customer" do
      user = create(:user, stripe_customer_id: FakeStripe::CUSTOMER_ID)
      expect(invoice.user).to eq(user)
    end

    it 'returns the invoice paid status from stripe' do
      expect(invoice).to be_paid
    end

    it 'returns the invoice number from stripe' do
      expect(invoice.number).to eq('b9181a962e-0003')
    end

    it 'returns the date from stripe' do
      expect(invoice.date).to eq(Time.zone.at(1508524062).strftime('%D'))
    end

    it 'returns the balance equal to amount_due when not paid' do
      Invoice.new(FakeStripe::INVOICE_ID)
      stub_invoice = double("StripeInvoice", amount_due: 900, paid: false)
      allow(Stripe::Invoice).to receive(:retrieve).and_return(stub_invoice)
      expect(invoice.balance).to eq 9.00
    end

    it 'returns the proper partial path' do
      expect(invoice.to_partial_path).to eq('invoices/invoice')
    end
  end
end
