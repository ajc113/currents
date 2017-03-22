species_list = [
  {
    primary_species: "Bluefish",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    primary_species: "Striped Bass",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    primary_species: "Flounder",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    primary_species: "Tataug",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    primary_species: "Mako Shark",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    primary_species: "Bluefin Tuna",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    primary_species: "Fluke",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    primary_species: "Wahoo",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    primary_species: "Tuna Yellowfin",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    primary_species: "Shark Thresher",
    state_waters: "MA",
    located: "Offshore",
  }
]

puts "creating Species"

species_list.each do |spcie|
  begin
    Specie.create!(spcie)
    print '.'
  rescue
    ActiveRecord::RecordInvalid
    print 'F'
  end
end

puts "#{Specie.count} species created"
