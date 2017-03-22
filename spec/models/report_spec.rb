RSpec.describe Report, "Scopes" do
  it ".selected_species should return records with specified species" do
    report = Report.create! :target_species => "Tuna", :date => "03-03-2016"
    selected_species = Report.where(:target_species => "Tuna")
    expect(Report.selected_species("Tuna")).to eq selected_species
  end

  it ".selected_species should not return records apart from specified" do
    selected_species = Report.where :target_species => "Not Tuna"
    expect(Report.selected_species("Tuna")).not_to eq selected_species
  end

  it ".selected_location should return records with specified locations" do
    location = Location.create!(:short_name => "NY", :coordinate_file => Rails.root.join("db/seed_data/location_coordinate_files/test.json").open)
    @location_id = location.id
    selected_location = Report.where(:location_id => @location_id)
    expect(Report.selected_location(@location_id)).to eq selected_location
  end

  it ".selected_location should not return records apart from specified" do
    selected_location = Report.where.not(:location_id => @location_id)
    expect(Report.selected_location(@location_id)).not_to eq selected_location
  end

  it "can not be created in the future" do
    expect { Report.create!(date: 2.years.from_now) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Date must not be set in the future")
  end

  it ".selected_tide should return records with specified tide" do
  	Report.create! :tide => "Incoming", :date => "03-03-2016"
  	selected_tide = Report.where(:tide => "Incoming")
  	expect(Report.selected_tide("Incoming")).to eq selected_tide
  end

  it ".selected_tide should not return records apart from specified" do
  	selected_tide = Report.where.not(:tide => "Not Incoming")
  	expect(Report.selected_tide("Incoming")).not_to eq selected_tide
  end

end
