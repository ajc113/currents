species_list = [
  {
    name: "Bluefish",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    name: "Striped Bass",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    name: "Flounder",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    name: "Tataug",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    name: "Mako Shark",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    name: "Bluefin Tuna",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    name: "Fluke",
    state_waters: "MA",
    located: "Inshore",
  },
  {
    name: "Wahoo",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    name: "Tuna Yellowfin",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    name: "Shark Thresher",
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
