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

  scenario "Locations page" do
    click_link('Locations')
    expect(page).to have_http_status(200)
    expect(page).to have_content('Locations')
  end

  scenario "Edit location" do
    click_link('Locations')
    click_link('Edit')
    expect(page).to have_http_status(200)
    expect(page).to have_content('Edit Location')
    expect(page).to have_field('location_short_name', with: @location.short_name)
    expect(page).to have_field('location_long_name', with: @location.long_name)
    expect(page).to have_field('location_coordinate_file')
    expect(page).to have_field('location_number')
    expect(page).to have_field('location_state_waters', with: @location.state.name)
  end

  scenario "New Location" do
    click_link('Locations')
    click_link('New Location')
    expect(page).to have_http_status(200)
    expect(page).to have_content('New Location')
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

  scenario "Buzzs page" do
    click_link('Buzzs')
    expect(page).to have_content('Buzzs')
  end

  scenario "Buzz edit page" do
    click_link('Buzzs')
    click_link('Edit')
    expect(page).to have_http_status(200)
    expect(page).to have_content('Edit Buzz')
  end

  scenario "Users page" do
    click_link('Admin Users')
    expect(page).to have_title('Admin Users')
  end

  scenario "Species page" do
    click_link('Species')
    expect(page).to have_title('Species')
  end

  scenario "Edit Species page" do
    click_link('Species')
    click_link('Edit')
    expect(page).to have_field('species_name', with: @species.name)
    expect(page).to have_field('species_located', with: @species.located)
  end

end
