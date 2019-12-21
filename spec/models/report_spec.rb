RSpec.describe Report, "Scopes" do
  before do
    @state = create(:state)
    @location = create(:location)
  end

  it { should belong_to :location }
  it { should belong_to :species }
  it { should belong_to :user }

  it ".selected_species should return records with specified species" do
    report = build(:report, species_id: 2)
    species = Report.where(:species_id => 2)
    expect(Report.species(2)).to eq species
  end

  it ".selected_species should not return records apart from specified" do
    species = Report.where :species_id => 2
    expect(Report.species(3)).not_to eq species
  end

  it ".selected_location should return records with specified locations" do
    location = build(:location)
    @location_id = location.id
    location = Report.where(:location_id => @location_id)
    expect(Report.location(@location_id)).to eq location
  end

  it ".selected_location should not return records apart from specified" do
    location = Report.where.not(:location_id => @location_id)
    expect(Report.location(@location_id)).not_to eq location
  end

  it "can not be created in the future" do
    expect { create(:report, :date => 2.years.from_now) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Date must not be set in the future")
  end

  it ".selected_tide should return records with specified tide" do
    build(:report, tide: "Incoming")
  	tide = Report.where(:tide => "Incoming")
  	expect(Report.tide("Incoming")).to eq tide
  end

  it ".selected_tide should not return records apart from specified" do
  	tide = Report.where.not(:tide => "Not Incoming")
  	expect(Report.tide("Incoming")).not_to eq tide
  end

end
