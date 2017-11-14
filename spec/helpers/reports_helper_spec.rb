require 'rails_helper'

RSpec.describe ReportsHelper, type: :helper do

  it "returns unique species from filter reports" do
    species_1 = create(:species, name: "speices 1")
    species_2 = create(:species, name: "speices 2")
    species_3 = create(:species, name: "speices 3")

    reports = [
      create(:report, species: species_1),
      create(:report, species: species_2),
      create(:report, species: species_2)
    ]

    expect(helper.all_species).to include(species_1, species_2)
    expect(helper.all_species).not_to include(species_3)
  end

  it "creates options for location" do
    location = build_stubbed(:location, id: 123, number: 3)
    option = helper.render_location_option(location)
    expect(option).to eq('<option value="123">03 - dummy_location</option>')
  end

  it "creates option with state name for location" do
    state = build_stubbed(:state, name: "MA")
    location = build_stubbed(:location, id: 123, number: 3, state: state)
    expect(helper.render_location_option_with_state(location)).to eq('<option value="123" >dummy_location (MA)</option>')
  end
end
