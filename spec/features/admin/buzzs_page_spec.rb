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
end
