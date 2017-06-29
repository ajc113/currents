require 'rails_helper'
RSpec.feature "Admin visits" do
  before do
    @admin_user = create(:admin_user)
    @state = create(:state, name: "MA")
    @location = create(:location)
    admin_login(@admin_user)
    @species = create(:species)
    @report = create(:report, location: @location)
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
