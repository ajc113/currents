require 'rails_helper'
RSpec.feature "Admin visits" do
  before do
    @admin_user = create(:admin_user)
    create(:state, name: "MA")
    @location = create(:location)
    admin_login(@admin_user)
  end 

  scenario "Locations page" do
    click_link('Locations')
    expect(page).to have_content('Locations')
  end

  scenario "Edit location" do
    click_link('Locations')
    click_link('Edit')
    expect(page).to have_content('Edit Location')
    expect(page).to have_field('location_short_name', with: @location.short_name)
    expect(page).to have_field('location_long_name', with: @location.long_name)
    expect(page).to have_field('location_coordinate_file')
    expect(page).to have_field('location_number')
    expect(page).to have_field('location_state_waters', with: @location.state.name)
  end

  scenario "Reports page" do
    click_link('Reports')
    expect(page).to have_content('Reports')
  end
end
