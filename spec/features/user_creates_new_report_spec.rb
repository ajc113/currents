require "rails_helper"
RSpec.feature "User opens Log Catch Report page", :js => true do
  before do
    @state = create(:state)
    Species.create(name:"Bluefish")
    new_user = create(:user, state_waters: @state.name)
    Location.create(number: 1,
                    short_name: "Stellwagen Bank - (NWC) Northwest Corner",
                    state_waters: @state.name,
                    coordinate_file: Rails.root.join("db/seed_data/location_coordinate_files/" + "Stellwagen Bank - (NWC) Northwest Corner".underscore.parameterize(separator: "_") + ".json").open)
    login_as(new_user, :scope => :user)
  end

  scenario "to log new catch report" do
    visit new_report_path
    fill_in "report[date]", :with => "22/10/2017"
    select "Bluefish", :from => "report[species_id]"
    select @state.name, :from => "report[state_waters]" 
    wait_for_ajax
    select "01 - Stellwagen Bank - (NWC) Northwest Corner", :from => "report[location_id]"
    fill_in "report[catch_keepers]", :with => 23
    find("input[name='commit']").click 
    expect(page).to have_content("Report was successfully created.")
  end
end
