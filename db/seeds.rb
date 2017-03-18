location_list = [
  {
    number: 7,
    short_name: "Cape Cod - Peaked Hill Bar",
    long_name: "Peaked Hill Bar down to golfball",
  },
  {
    number: 6,
    short_name: "Cape Cod Backside",
    long_name: "Golfball, backside beaches down to nauset inlet",

  },
  {
    number: 3,
    short_name: "Stellwagen Bank - (SWC) South West Corner",
    long_name: "The notch south to the sw corner",
  },
  {
    number: 4,
    short_name: "Stellwagen Bank - (SEC) South East Corner",
    long_name: "Middle bank east to the edge",
  },
  {
    number: 2,
    short_name: "Stellwagen Bank - Middlebank",
    long_name: "Middlebank south to the notch",
  },
  {
    number: 1,
    short_name: "Stellwagen Bank - (NWC) Northwest Corner",
    long_name: "Northwest Corner of Stellwagen Bank south to middlebank covering, the western edge to middlebank.",
  },
  {
    number: 8,
    short_name: "Cape Cod - Race Point",
    long_name: "Race Point, Bathhouse to Wood End",
  },
  {
    number: 9,
    short_name: "Cape Cod - Provincetown",
    long_name: "Provincetown Harbor to Pamet River",
  },
  {
    number: 10,
    short_name: "Cape Cod - Billingsgate Shoals",
    long_name: "Billingsgate shoals, The path south to Brewster flats",
  },
  {
    number: 11,
    short_name: "Cape Cod - Wellfleet Harbor",
    long_name: "Wellfleet Harbor to Brewster Flats",
  },
  {
    number: 16,
    short_name: "South Shore - Plymouth Bay",
    long_name: "Plymouth, Duxbury, and Kingston Bays",
  },
  {
    number: 15,
    short_name: "Cape Cod Canal",
    long_name: "The Ditch",
  },
  {
    number: 13,
    short_name: "Cape Cod Bay - (SW )Southwest",
    long_name: "PowerPlant, Manomet and White Cliffs down to canal",
  },
  {
    number: 12,
    short_name: "Cape Cod Bay - South",
    long_name: "Canal, Scorton Creek to Barnstable, including the Fingers",
  },
  {
    number: 14,
    short_name: "Cape Cod Bay - (NW ) Northwest",
    long_name: "Green Harbor south to the PowerPlant.  Included Farnham, High Pines Ledge and the Gurnet.",
  },
  {
    number: 17,
    short_name: "South Shore - Scituate",
    long_name: "BrantRock, North River, Scituate, to Minots including offshore ledges",
  },
  {
    number: 18,
    short_name: "Boston - Inner Harbor",
    long_name: "Boston Harbor out to Dear Island, Pt Allerton",
  },
  {
    number: 19,
    short_name: "Boston - Outer Harbor",
    long_name: "Boston Outer Harbor to  Nahant Bay, offshore ledges down to the glades.",
  },
  {
    number: 5,
    short_name: "Stellwagen Bank - Eastside",
    long_name: "Waters east of middlebank out to WildCat Knoll",
  },
  {
    number: 25,
    short_name: "Cape Cod - Chatham",
    long_name: "Nauset Inlet to Chatham Harbor out to the 3 mile line",
  },
  {
    number: 22,
    short_name: "Cape Cod - Whiting Grounds",
    long_name: "Whiting Grounds to to the gulley",
  },
  {
    number: 20,
    short_name: "North Shore",
    long_name: "Marblehead, Salem Sound, Gloucester to Thatcher Island",
  },
  {
    number: 21,
    short_name: "North Shore - Merrimack",
    long_name: "Halibut Point, Plum island north to the Merrimack.",
  },
  {
    number: 23,
    short_name: "Jeffreys Ledge - West",
    long_name: "West portion of Jeffreys Ledge",
  },
  {
    number: 24,
    short_name: "Jeffreys Ledge - East",
    long_name: "Eastern portions of Jeffreys Ledge",
  },
  {
    number: 26,
    short_name: "Cape Cod - Monomoy",
    long_name: "Monomoy Shoals",
  },
  {
    number: 27,
    short_name: "Cape Cod - Nantucket Sound East",
    long_name: "Eastern Nantucket sound out to Monomoy.  Hyanis south to Muskeget Island",
  },
  {
    number: 28,
    short_name: "Cape Cod - Nantucket Sound West",
    long_name: "Western Nantucket sound from Falmouth to Hyannis south to Cape Poge.  Includes hedge fence, and horseshoe shoals.",
  },
  {
    number: 29,
    short_name: "Vineyard Sound",
    long_name: "Vineyard Sound  and Elizabeth islands including Quick's, Robinson's, and Wood's hole.  Cuttyhunk to Falmouth.",
  },
  {
    number: 31,
    short_name: "Buzzards Bay - East",
    long_name: "Mass Maritime west to Mattapoisett.  Includes Onset, Wareham , Marion, Pocasset, and North Falmouth.",
  },
  {
    number: 30,
    short_name: "Buzzards Bay - West",
    long_name: "Westport east to New Bedford.  Includes Dartmouth, Cuttyhunk and Gosnold, Naushon Island.",
  }
]

def coordinate_file_path location_name
  location_name = location_name.underscore.parameterize("_")
  Rails.root.join("db/seed_data/location_coordinate_files/#{location_name}.json")
end

location_list.each do |location|
  new_location = Location.create!(location)
  new_location.coordinate_file = Rails.root.join("db/seed_data/location_coordinate_files/" + location[:short_name].underscore.parameterize("_") + ".json").open
  new_location.save!
end
print "#{Location.count} created"

2.times do |i|
  begin
    User.create!(
      email: FFaker::Internet.email,
      confirmed_at: DateTime.now,
      password: 'password'
    )
    print '.'
  rescue ActiveRecord::RecordInvalid
    print 'F'
  end
end
