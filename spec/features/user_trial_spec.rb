require 'rails_helper'

RSpec.feature "User trial", js: true do
  context "is active" do
    before do
      @state = create(:state)
      Species.create(name:"Bluefish")
      new_user = create(:user, state_waters: @state.name)
      Location.create(number: 1,
                      short_name: "Stellwagen Bank - (NWC) Northwest Corner",
                      state_waters: @state.name,
                      coordinate_file: Rails.root.join("db/seed_data/location_coordinate_files/" + "Stellwagen Bank - (NWC) Northwest Corner".underscore.parameterize("_") + ".json").open)
      login_as(new_user, :scope => :user)
    end

    scenario "and user visits reports page" do
      visit reports_path
      expect(page).to have_content("Log a Report")
    end
  end

  context "is not active" do
    before do
      @state = create(:state)
      Species.create(name:"Bluefish")
      new_user = create(:user, state_waters: @state.name, created_at: Date.today - 40)
      Location.create(number: 1,
                      short_name: "Stellwagen Bank - (NWC) Northwest Corner",
                      state_waters: @state.name,
                      coordinate_file: Rails.root.join("db/seed_data/location_coordinate_files/" + "Stellwagen Bank - (NWC) Northwest Corner".underscore.parameterize("_") + ".json").open)
      login_as(new_user, :scope => :user)
    end
    scenario "and user visits reports page" do
      visit reports_path
      expect(page).to have_content("You must have active subscription to see the Live Fishing Reoports of other users")
    end
  end
end
