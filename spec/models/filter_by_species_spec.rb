RSpec.describe FilterBySpecies do
  let(:user) { build_stubbed(:user) }
  let(:state) { create(:state) }

  it "should return appropriate color for different standard deviation values" do
    filter_by_species = FilterBySpecies.new(user, state.id)
    expect(filter_by_species.color 2).to eq('#FF3E38')
    expect(filter_by_species.color 0.5).to eq('#C1AF6A')
    expect(filter_by_species.color 0).to eq('#4562A8')
  end
end
