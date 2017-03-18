species_list = [
  {
    primary_species: "Bluefish",
    state_waters: 
    located:
  },
  {
    primary_species: "Cod & Haddock",
    state_waters:
    located:
  },
  {
    primary_species: "Flounder",
    state_waters:
    located:
  },
  {
    primary_species: "Striped Bass",
    state_waters:
    located:
  },
  {
    primary_species: "Sharks",
    state_waters:
    located:
  },
  {
    primary_species: "Tuna",
    state_waters:
    located:
  },
  {
    primary_species: "Mackeral, Pogies, Herring",
    state_waters:
    located:
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