require "rails_helper"
#include Warden::Test::Helpers
Capybara.javascript_driver = :webkit
  new_user = User.create(email: FFaker::Internet.email, password: FFaker::Internet.password, confirmed_at: DateTime.now)
  login_as(new_user, :scope => :user)
RSpec.feature "User opens Log Catch Report page", :js => true do
  scenario "to log new catch report" do
    visit new_report_path
    select DateTime.now.day-1, :from => "report[date(3i)]"
    select "Bluefish", :from => "report[species_id]"
    select "MA", :from => "report[state]" 
    wait_for_ajax
    select "01 - Stellwagen Bank - (NWC) Northwest Corner", :from => "report[location_id]"
    fill_in "report[catch_keepers]", :with => 23
    find("input[name='commit']").click 
    expect(page).to have_content("Report was successfully created.")
  end
end
