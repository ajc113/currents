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

  scenario "Reports page" do
    click_link('Reports')
    expect(page).to have_http_status(200)
    expect(page).to have_content('Reports')
  end

  scenario "Edit Report" do
    click_link('Reports')
    click_link('Edit')
    expect(page).to have_http_status(200)
    expect(page).to have_content('Edit Report')
  end

  scenario "New Report page" do
    click_link('Reports')
    click_link('New Report')
    expect(page).to have_http_status(200)
    expect(page).to have_content('New Report')
    expect(page).to have_select('report_state_waters')
    expect(page).to have_select('report_location_id')
    select @state.name, from: 'report_state_waters'
  end
end
