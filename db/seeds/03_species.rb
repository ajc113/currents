species_list = [
  {
    name: "Bluefish",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "Bonito",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "Cod",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "False Albacore",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "Flounder (Winter)",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "Fluke",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "Haddock",
    state_waters: "MA",
    located: "Offshore",
  },
    {
    name: "Mahi Mahi",
    state_waters: "MA",
    located: "Offshore",
  },
    {
    name: "Marlin (White)",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    name: "Pollock",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "Scup",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "Seabass",
    state_waters: "MA",
    located: "Inshore",
  },
    {
    name: "Shark (Blue)",
    state_waters: "MA",
    located: "Offshore",
  },
    {
    name: "Shark (Mako)",
    state_waters: "MA",
    located: "Offshore",
  },
    {
    name: "Shark (Thresher)",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    name: "Striped Bass",
    state_waters: "MA",
    located: "Inshore",
  },

  {
    name: "Tataug",
    state_waters: "MA",
    located: "Inshore",
  },

  {
    name: "Tuna (Albacore",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    name: "Tuna (Big Eye)",
    state_waters: "MA",
    located: "Offshore",
  },
    {
    name: "Tuna (Bluefin)",
    state_waters: "MA",
    located: "Offshore",
  },
    {
    name: "Tuna (Yellowfin)",
    state_waters: "MA",
    located: "Offshore",
  },
  {
    name: "Wahoo",
    state_waters: "MA",
    located: "Offshore",
  }
]

puts "creating Species"

species_list.each do |spcie|
  begin
    Species.create!(spcie)
    print '.'
  rescue
    ActiveRecord::RecordInvalid
    print 'F'
  end
end

puts "#{Species.count} species created"
