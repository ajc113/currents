require 'rails_helper'

RSpec.feature "User views invoices", type: :feature do
  before do
    @state = create(:state)
    new_user = create(:user, 
                      state_waters: @state.name,
                      stripe_customer_id: FakeStripe::CUSTOMER_ID,
                      subscription_id: FakeStripe::SUBSCRIPTION_ID
                     )
    login_as(new_user, :scope => :user)
  end

  scenario "User views list of all invoices" do
    visit  invoices_path
    expect(page).to have_title('Invoices')
    expect(page).to have_selector('table tr td')
    expect(page).to have_text('b9181a962e-0003')
    expect(page).to have_text('10/20/17')
    expect(page).to have_text('$9.00')
    expect(page).to have_text('09/20/17 to 10/20/17')
    expect(page).to have_text('Paid')
  end

  scenario "User views an invoice" do
    visit invoice_path(FakeStripe::INVOICE_ID)
    expect(page).to have_title('Invoice')
    expect(page).to have_content('Invoice in_1s4JSgbcUaElzU')
    expect(page).to have_selector('table tr td')
    expect(page).to have_css('.amount-table')
    expect(page).to have_text('10/20/17')
    expect(page).to have_css('.paid', text: '$9.00')
    expect(page).to have_css('.tax', text: '$0.00')
    expect(page).to have_css('.paid', text: '$9.00')
    expect(page).to have_css('.balance', text: '$0.00')
  end
end
