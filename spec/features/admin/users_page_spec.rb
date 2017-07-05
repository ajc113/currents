require 'rails_helper'
RSpec.feature "Admin visits" do
  before do
    @admin_user = create(:admin_user)
    @state = create(:state, name: "MA")
    @location = create(:location)
    admin_login(@admin_user)
    @species = create(:species)
    @report = create(:report, location: @location)
    @buzz = create(:buzz)
  end 

  scenario "Users page" do
    click_link('Admin Users')
    expect(page).to have_title('Admin Users')
  end
end
