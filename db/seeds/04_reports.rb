reports_list = [
  {
    species_id: 2,
    user_id: 1,
    location_id: 7,
    date: rand(364).days.ago,
    catch_keepers: 10,
    catch_total: 20,
    trip_summary: "Good bite on the incoming, large keepers over 45 inches",
    primary_method: "Live Bait",
    tide: "Incoming",
    weather: "rain",
    wind: "SW 10-15",
    spot: "peaked hill bar",
    best_bait: "live mackeral",
    trip_description: "Early morning trip to the race, moved down along the backside and found fish at peaked hill"
  },
  {
    species_id: 3,
    user_id: 1,
    location_id: 4,
    date: rand(364).days.ago,
    catch_keepers: 12,
    catch_total: 15,
    trip_summary: "steady bite in saquish rip",
    primary_method: "Live Bait",
    tide: "Outgoing",
    weather: "Sun",
    wind: "NE 5",
    spot: "Saquish rip",
    best_bait: "seaworms",
    trip_description: "steady bite with chum in the saquish rip through the entire outgoing tide"
  },
  {
    species_id: 5,
    user_id: 1,
    location_id: 3,
    date: rand(364).days.ago,
    catch_keepers: 1,
    catch_total: 1,
    trip_summary: "Large make caught on a kite floating bluefish",
    primary_method: "Live Bait",
    tide: "Slack",
    weather: "Overcast",
    wind: "NE 15-20",
    spot: "Southwest Corner of Stellwagen",
    best_bait:  "Bluefish",
    trip_description: "SW Corner of the bank very active with bait and whales, without any signs large mako took the kite bait at slack tide"
  },
  {
    species_id: 3,
    user_id: 1,
    location_id: 12,
    date: rand(364).days.ago,
    catch_keepers: 8,
    catch_total: 20,
    trip_summary: "Slow pick of keepers on rockpiles",
    primary_method: "Dead Bait",
    tide: "Incoming",
    weather: "Rain",
    wind: "NW 5-15",
    spot: "Buzzards Bay",
    best_bait: "Green Crabs",
    trip_description: "Alot of action of the BB rockpiles had to pick through shorts to get a dozen keepers"
  },
  {
    species_id: 6,
    user_id: 1,
    location_id: 3,
    date: rand(364).days.ago,
    catch_keepers: 2,
    catch_total: 3,
    trip_summary: "Great tuna bite on prince edward island all large fish",
    primary_method: "Live Bait",
    tide: "Incoming",
    weather: "Cloudy",
    wind: "N 15-20",
    spot: "Souris fishermans bank",
    best_bait: "Mackeral",
    trip_description: "All large fish on fishermans bank had two to boat and broke another off"
  },
  {
    species_id: 7,
    user_id: 1,
    location_id: 5,
    date: rand(364).days.ago,
    catch_keepers: 3,
    catch_total: 3,
    trip_summary: "slow bit in Duxubry chanel fish have moved offshore",
    primary_method: "Troll",
    tide: "Incoming",
    weather: "Fog",
    wind: "E 5",
    spot: "Duxbury chanel",
    best_bait: "Squid strips trolled",
    trip_description: "very slow pick trolling squid baits in duxbury channel, action from last week has stoped and fish seemed to have moved out."
  }
]

reports_list.each do |report|
  begin
    Report.create!(report)
    print '.'
  rescue
    ActiveRecord::InvalidRecord
    print 'F'
  end
end

puts "#{Report.count} reports created"
