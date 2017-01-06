AdminUser.create!([
  {email: "admin@example.com", encrypted_password: "$2a$11$Er6oZwQyTlbcefedjU5kJOzYH9N20VYAduioWXQfa92PKDUK4YYG6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 23, current_sign_in_at: "2016-12-21 15:01:41", last_sign_in_at: "2016-12-21 14:57:21", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {email: "costa.aj@gmail.com", encrypted_password: "$2a$11$RkuojkZ2O/czIsP4D8QGS./s2P1e8exu18BnAY2gv1nwOtO/kZLFO", reset_password_token: "115a9093a224286d7e9414a898dd92a87e717abd5cd2549d56317ad0c606a0fb", reset_password_sent_at: "2016-12-21 15:03:54", remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2017-01-06 21:29:30", last_sign_in_at: "2016-12-21 15:04:51", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
Location.create!([
  {short_name: "07. Cape Cod - Peaked Hill Bar", long_name: "Peaked Hill Bar down to golfball", coordinates: [], coordinate_file: "53_ph.json"},
  {short_name: "06. Cape Cod Backside", long_name: "Golfball , backside beaches down to nauset inlet", coordinates: [], coordinate_file: "54_backside.json"},
  {short_name: "03. Stellwagen Bank - (SWC) South West Corner", long_name: "The notch south to the sw corner", coordinates: [], coordinate_file: "56_sw_swc.json"},
  {short_name: "04. Stellwagen Bank - (SEC) South East Corner", long_name: "Middle bank east to the edge", coordinates: [], coordinate_file: "58_sw_sec.json"},
  {short_name: "02. Stellwagen Bank - Middlebank", long_name: "Middlebank south to the notch", coordinates: [], coordinate_file: "59_sw_middle.json"},
  {short_name: "01. Stellwagen Bank - (NWC) Northwest Corner", long_name: "Northwest Corner of Stellwagen Bank south to middlebank covering the western edge to middlebank.", coordinates: [], coordinate_file: "60_sw_nwc.json"},
  {short_name: "08. Cape Cod - Race Point", long_name: "Race Point, Bathhouse to Wood End", coordinates: [], coordinate_file: "62_race.json"},
  {short_name: "09. Cape Cod - Provincetown", long_name: "Provincetown Harbor to Pamet River", coordinates: [], coordinate_file: "63_ptown.json"},
  {short_name: "10. Cape Cod - Billingsgate Shoals", long_name: "Billingsgate shoals, The path south to Brewster flats", coordinates: [], coordinate_file: "64_shoals.json"},
  {short_name: "11. Cape Cod - Wellfleet Harbor", long_name: "Wellfleet Harbor to Brewster Flats", coordinates: [], coordinate_file: "66_welfleet.json"},
  {short_name: "16. South Shore - Plymouth Bay", long_name: "Plymouth, Duxbury, and Kingston Bays", coordinates: [], coordinate_file: "67_plymouth.json"},
  {short_name: "15. Cape Cod Canal", long_name: "The Ditch", coordinates: [], coordinate_file: "68_canal.json"},
  {short_name: "13. Cape Cod Bay - (SW )Southwest", long_name: "PowerPlant , Manomet and White Cliffs down to canal", coordinates: [], coordinate_file: "69_ccb_sw.json"},
  {short_name: "12. Cape Cod Bay - South", long_name: "Canal, Scorton Creek to Barnstable, including the Fingers", coordinates: [], coordinate_file: "70_ccb_south.json"},
  {short_name: "14. Cape Cod Bay - (NW ) Northwest", long_name: "Green Harbor south to the PowerPlant.  Included Farnham, High Pines Ledge and the Gurnet.", coordinates: [], coordinate_file: "71_ccb_northwest.json"},
  {short_name: "17. South Shore - Scituate", long_name: "BrantRock, North River, Scituate, to Minots including offshore ledges", coordinates: [], coordinate_file: "72_scituate.json"},
  {short_name: "18. Boston - Inner Harbor", long_name: "Boston Harbor out to Dear Island, Pt Allerton", coordinates: [], coordinate_file: "73_boston_inner.json"},
  {short_name: "19. Boston - Outer Harbor", long_name: "Boston Outer Harbor to  Nahant Bay, offshore ledges down to the glades.", coordinates: [], coordinate_file: "75_boston_outer.json"},
  {short_name: "05. Stellwagen Bank - Eastside", long_name: "Waters east of middlebank out to WildCat Knoll", coordinates: [], coordinate_file: "sw_eastside.json"},
  {short_name: "25. Cape Cod - Chatham", long_name: "Nauset Inlet to Chatham Harbor out to the 3 mile line", coordinates: [], coordinate_file: "84_Chatham.json"},
  {short_name: "22. Cape Cod - Whiting Grounds", long_name: "Whiting Grounds to to the gulley", coordinates: [], coordinate_file: "85_whiting_grounds.json"},
  {short_name: "20. North Shore", long_name: "Marblehead, Salem Sound, Gloucester to Thatcher Island", coordinates: [], coordinate_file: "86_north_shore.json"},
  {short_name: "21. North Shore - Merrimack", long_name: "Halibut Point, Plum island north to the Merrimack.", coordinates: [], coordinate_file: "87_north_shore_north.json"},
  {short_name: "23. Jeffreys Ledge - West", long_name: "West portion of Jeffreys Ledge", coordinates: [], coordinate_file: "88_jefferies_west.json"},
  {short_name: "24. Jeffreys Ledge - East", long_name: "Eastern portions of Jeffreys Ledge", coordinates: [], coordinate_file: "89_jefferies_east.json"},
  {short_name: "26. Cape Cod - Monomoy", long_name: "Monomoy Shoals", coordinates: [], coordinate_file: "90_monomoy.json"},
  {short_name: "27. Cape Cod - Nantucket Sound East", long_name: "Eastern Nantucket sound out to Monomoy.  Hyanis south to Muskeget Island", coordinates: [], coordinate_file: "91_Nantucket_S_East.json"},
  {short_name: "28. Cape Cod - Nantucket Sound West", long_name: "Western Nantucket sound from Falmouth to Hyannis south to Cape Poge.  Includes hedge fence, and horseshoe shoals.", coordinates: [], coordinate_file: "92_nantucket_sound_west.json"},
  {short_name: "29. Vineyard Sound", long_name: "Vineyard Sound  and Elizabeth islands including Quick's, Robinson's, and Wood's hole.  Cuttyhunk to Falmouth.", coordinates: [], coordinate_file: "93_vineyard_sound.json"},
  {short_name: "31. Buzzards Bay - East", long_name: "Mass Maritime west to Mattapoisett.  Includes Onset, Wareham, Marion, Pocasset, and North Falmouth.", coordinates: [], coordinate_file: "94_buzzbay_east.json"},
  {short_name: "30. Buzzards Bay - West", long_name: "Westport east to New Bedford.  Includes Dartmouth, Cuttyhunk, and Gosnold, Naushon Island.", coordinates: [], coordinate_file: "95_buzzbay_west.json"}
])
Report.create!([
  {target_species: "Tuna", catch_keepers: 1, catch_total: 1, trip_summary: "Insane", primary_method: "live bait", tide: "", weather: "", wind: "", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 53, user_id: 1, date: "2016-05-29"},
  {target_species: "Haddock", catch_keepers: 15, catch_total: 15, trip_summary: "Insane Haddock bite got limit in 2 hours", primary_method: "Bait", tide: "Incoming", weather: "Foggy", wind: "SW 5-15", spot: "Middlebank to eastside", best_bait: "Jigs", trip_description: "", latitude: nil, longitude: nil, location_id: 59, user_id: 6, date: "2016-03-06"},
  {target_species: "Tuna", catch_keepers: 1, catch_total: 1, trip_summary: "Kite bite live mack", primary_method: "Live Bait", tide: "slack", weather: "", wind: "", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 53, user_id: 2, date: "2016-06-01"},
  {target_species: "Tuna", catch_keepers: 0, catch_total: 0, trip_summary: "No Tuna to be seen", primary_method: "Live Bait", tide: "Slack", weather: "Cloudy", wind: "SW", spot: "2343.2343", best_bait: "None", trip_description: "", latitude: nil, longitude: nil, location_id: 56, user_id: 1, date: "2015-07-24"},
  {target_species: "Bluefish", catch_keepers: 20, catch_total: 45, trip_summary: "Fish consistent through entire incoming", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "23423.", best_bait: "Mackeral", trip_description: "a;lkjf;lakjdf;lajkdfl;kajsf;ljsadl;fjas;lfjkas;lkdfjl;asdfjkal;", latitude: nil, longitude: nil, location_id: 54, user_id: 3, date: "2015-04-10"},
  {target_species: "Bluefish", catch_keepers: 1, catch_total: 1, trip_summary: "awesome", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 53, user_id: 3, date: "2016-06-07"},
  {target_species: "Striped Bass", catch_keepers: 5, catch_total: 20, trip_summary: "New report for user", primary_method: "Live Bait", tide: "Outgoing", weather: "Overcast", wind: "SE < 10 mph", spot: "backside beaches were on fired", best_bait: "Mackeral", trip_description: "", latitude: nil, longitude: nil, location_id: 54, user_id: 3, date: "2016-06-11"},
  {target_species: "Flounder", catch_keepers: 0, catch_total: 0, trip_summary: "skunk", primary_method: "Live Bait", tide: "Slack", weather: "Overcast", wind: "W > 20 mph", spot: "sw corner", best_bait: "herring", trip_description: "", latitude: nil, longitude: nil, location_id: 56, user_id: nil, date: "2016-06-13"},
  {target_species: "Cod & Haddock", catch_keepers: 1, catch_total: 2, trip_summary: "Huge Tataug", primary_method: "Jigging", tide: "Outgoing", weather: "Sun", wind: "NE 10-20 mph", spot: "Saquish rips", best_bait: "Shimano Coltsniper", trip_description: "", latitude: nil, longitude: nil, location_id: 60, user_id: 3, date: "2016-06-20"},
  {target_species: "Flounder", catch_keepers: 25, catch_total: 25, trip_summary: "awesome", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "ptown harbor", best_bait: "seaworms", trip_description: "insane bite", latitude: nil, longitude: nil, location_id: 63, user_id: 3, date: "2016-07-08"},
  {target_species: "Tuna", catch_keepers: 1, catch_total: 1, trip_summary: "Top water bite", primary_method: "Popping", tide: "Incoming", weather: "Overcast", wind: "E < 10 mph", spot: "east side off the edge of the bank", best_bait: "Ronz Z", trip_description: "", latitude: nil, longitude: nil, location_id: 58, user_id: 3, date: "2016-08-07"},
  {target_species: "Bluefish", catch_keepers: 5, catch_total: 5, trip_summary: "good", primary_method: "Trolling", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "backside", best_bait: "jigs", trip_description: "", latitude: nil, longitude: nil, location_id: 53, user_id: 1, date: "2016-07-21"},
  {target_species: "Striped Bass", catch_keepers: 15, catch_total: 20, trip_summary: "macks", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 62, user_id: 1, date: "2016-07-08"},
  {target_species: "Striped Bass", catch_keepers: 25, catch_total: 30, trip_summary: "good", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 53, user_id: 1, date: "2016-07-16"},
  {target_species: "Bluefish", catch_keepers: 3, catch_total: 5, trip_summary: "slowing down", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 53, user_id: 1, date: "2016-08-04"},
  {target_species: "Tuna", catch_keepers: 1, catch_total: 1, trip_summary: "80\"", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 53, user_id: 1, date: "2016-09-14"},
  {target_species: "Tuna", catch_keepers: 3, catch_total: 3, trip_summary: "picking up", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 58, user_id: 1, date: "2016-11-14"},
  {target_species: "Tuna", catch_keepers: 5, catch_total: 5, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 71, user_id: 3, date: "2016-11-15"},
  {target_species: "Tuna", catch_keepers: 3, catch_total: 3, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 71, user_id: 3, date: "2016-11-14"},
  {target_species: "Striped Bass", catch_keepers: 5, catch_total: 5, trip_summary: "awesome", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 62, user_id: 3, date: "2016-11-21"},
  {target_species: "Striped Bass", catch_keepers: 4, catch_total: 4, trip_summary: "asdfasfsa", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 62, user_id: 3, date: "2016-11-20"},
  {target_species: "Striped Bass", catch_keepers: 3, catch_total: 3, trip_summary: "asdfasdf", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 62, user_id: 3, date: "2016-11-19"},
  {target_species: "Bluefish", catch_keepers: 25, catch_total: 25, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 53, user_id: 3, date: "2016-11-25"},
  {target_species: "Tuna", catch_keepers: 3, catch_total: 3, trip_summary: "asdfasdf", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 71, user_id: 3, date: "2016-12-08"},
  {target_species: "Bluefish", catch_keepers: 2, catch_total: 2, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 54, user_id: 3, date: "2016-11-25"},
  {target_species: "Bluefish", catch_keepers: 1, catch_total: 1, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 54, user_id: 3, date: "2016-11-24"},
  {target_species: "Tuna", catch_keepers: 20, catch_total: 20, trip_summary: "awesome", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 56, user_id: 3, date: "2016-12-04"},
  {target_species: "Striped Bass", catch_keepers: 3, catch_total: 3, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 94, user_id: 3, date: "2016-12-04"},
  {target_species: "Bluefish", catch_keepers: 1, catch_total: 1, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 88, user_id: 3, date: "2016-12-04"},
  {target_species: "Striped Bass", catch_keepers: 5, catch_total: 5, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 62, user_id: 3, date: "2016-12-07"},
  {target_species: "Striped Bass", catch_keepers: 6, catch_total: 6, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 62, user_id: 3, date: "2016-12-08"},
  {target_species: "Striped Bass", catch_keepers: 7, catch_total: 7, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 62, user_id: 3, date: "2016-12-09"},
  {target_species: "Cod & Haddock", catch_keepers: 20, catch_total: 20, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 83, user_id: 3, date: "2016-12-05"},
  {target_species: "Cod & Haddock", catch_keepers: 15, catch_total: 15, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 83, user_id: 3, date: "2016-12-06"},
  {target_species: "Cod & Haddock", catch_keepers: 10, catch_total: 10, trip_summary: "slow", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 83, user_id: 3, date: "2016-12-08"},
  {target_species: "Cod & Haddock", catch_keepers: 50, catch_total: 50, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 83, user_id: 3, date: "2016-12-01"},
  {target_species: "Tuna", catch_keepers: 5, catch_total: 5, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 71, user_id: 3, date: "2016-12-05"},
  {target_species: "Tuna", catch_keepers: 5, catch_total: 5, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 71, user_id: 3, date: "2016-12-09"},
  {target_species: "Bluefish", catch_keepers: 2, catch_total: 2, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 67, user_id: 3, date: "2016-12-04"},
  {target_species: "Bluefish", catch_keepers: 3, catch_total: 3, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 67, user_id: 3, date: "2016-12-05"},
  {target_species: "Bluefish", catch_keepers: 4, catch_total: 4, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 67, user_id: 3, date: "2016-12-06"},
  {target_species: "Bluefish", catch_keepers: 5, catch_total: 5, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 67, user_id: 3, date: "2016-12-07"},
  {target_species: "Bluefish", catch_keepers: 3, catch_total: 3, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 67, user_id: 3, date: "2016-12-08"},
  {target_species: "Bluefish", catch_keepers: 2, catch_total: 2, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 67, user_id: 3, date: "2016-12-13"},
  {target_species: "Cod & Haddock", catch_keepers: 5, catch_total: 5, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 83, user_id: 3, date: "2016-12-09"},
  {target_species: "Tuna", catch_keepers: 6, catch_total: 6, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 71, user_id: 3, date: "2016-12-10"},
  {target_species: "Tuna", catch_keepers: 10, catch_total: 10, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 71, user_id: 3, date: "2016-12-11"},
  {target_species: "Bluefish", catch_keepers: 4, catch_total: 4, trip_summary: "Insane bite on the south side of browns bank", primary_method: "Trolling", tide: "Slack", weather: "Overcast", wind: "NE > 20 mph", spot: "132423432.43 X 23432423.45", best_bait: "Live Eels", trip_description: ";lkjjfa;sjf;lkdasjf;lasjflk;ajdfl;jdfl;ajflk;adjfl;adfjkl;ajkflkadsjflksajflka;jflk;asjflk;asjflk;sdjflajdfl;adjfljdfl;kjafl;kjkaljds", latitude: nil, longitude: nil, location_id: 67, user_id: 3, date: "2016-12-14"},
  {target_species: "Flounder", catch_keepers: 2, catch_total: nil, trip_summary: "", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 54, user_id: 3, date: "2016-12-12"},
  {target_species: "Tuna", catch_keepers: 2, catch_total: nil, trip_summary: "jhfhkjjfkjhg", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 71, user_id: 3, date: "2016-12-14"},
  {target_species: "Cod & Haddock", catch_keepers: 5, catch_total: 6, trip_summary: "5", primary_method: "Kite", tide: "Slack", weather: "Sun", wind: "W < 10 mph", spot: "dfasdf", best_bait: "asdfadsf", trip_description: "afdasdfsaf", latitude: nil, longitude: nil, location_id: 59, user_id: 3, date: "2016-12-15"},
  {target_species: "Tuna", catch_keepers: 1, catch_total: 2, trip_summary: "insane", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "asdf", best_bait: "asdf", trip_description: "asdf", latitude: nil, longitude: nil, location_id: 72, user_id: 3, date: "2016-12-15"},
  {target_species: "Cod & Haddock", catch_keepers: 0, catch_total: nil, trip_summary: "0", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 60, user_id: 3, date: "2016-12-15"},
  {target_species: "Flounder", catch_keepers: 0, catch_total: nil, trip_summary: "0", primary_method: "Live Bait", tide: "Incoming", weather: "Overcast", wind: "W < 10 mph", spot: "", best_bait: "", trip_description: "", latitude: nil, longitude: nil, location_id: 60, user_id: 3, date: "2016-12-15"}
])
User.create!([
  {email: "admin@example.com", encrypted_password: "$2a$11$VIzSb6HawTCd.Hof4szAUucTv5x2.SLBojT/xt/63bP0pazQFcsdO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 15, current_sign_in_at: "2016-12-05 23:40:25", last_sign_in_at: "2016-11-16 23:20:19", current_sign_in_ip: "::1", last_sign_in_ip: "127.0.0.1", first_name: "", last_name: "", home_port: "", state: "", vessel_name: "Doesnt Matter", confirmation_token: nil, confirmed_at: "2016-11-11 00:00:00", confirmation_sent_at: nil},
  {email: "costa.aj@gmail.com", encrypted_password: "$2a$11$aX217KUzxZw9BDt.paXKWO1lOsgNMyQAVxNcLu.LqiOEWrmelsgNa", reset_password_token: "005bdfcba0d0e52b8339a9bbc42e924bbe7aa7b9ac868f9305298c5047cf6d52", reset_password_sent_at: "2016-11-23 16:16:25", remember_created_at: nil, sign_in_count: 13, current_sign_in_at: "2017-01-01 00:29:33", last_sign_in_at: "2016-12-21 15:36:08", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "AJC", last_name: "Costa Jr", home_port: "Green Harbor", state: "MA", vessel_name: "Tradition", confirmation_token: nil, confirmed_at: "2016-11-11 00:00:00", confirmation_sent_at: nil},
  {email: "ajcosta1@gmail.com", encrypted_password: "$2a$11$HtzJhvTrcO7rpE6B/wbKBO1LdhkiPVL9Tu/JfcQXgBywPljp9clW2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 52, current_sign_in_at: "2017-01-03 00:27:11", last_sign_in_at: "2016-12-23 16:04:12", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Allen", last_name: "Costa", home_port: "Plymouth", state: "MA", vessel_name: "Obsession", confirmation_token: nil, confirmed_at: "2016-11-11 00:00:00", confirmation_sent_at: nil},
  {email: "costa.brooke@gmail.com", encrypted_password: "$2a$11$5fT8SwDN/B7/u23h/J.jhewfvCFOMl/3GEEI1GGPm8m7Q5Z48i/zy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-06-03 00:26:25", last_sign_in_at: "2016-06-03 00:26:25", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Brooke", last_name: "Costa", home_port: "Scituate", state: "MA", vessel_name: "Cinnamon", confirmation_token: nil, confirmed_at: "2016-11-11 00:00:00", confirmation_sent_at: nil},
  {email: "costa.jake@gmail.com", encrypted_password: "$2a$11$CH2ANlGssaQHIRKdK/Oxdu4BICXHrfvlf8i9758hz/LDW6scOSMCO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-06-03 00:34:30", last_sign_in_at: "2016-06-03 00:34:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Jake", last_name: "Costa", home_port: "Barnstable", state: "MA", vessel_name: "Pirate Ship", confirmation_token: nil, confirmed_at: "2016-11-11 00:00:00", confirmation_sent_at: nil},
  {email: "987654321@gmail.com", encrypted_password: "$2a$11$gGP1YBqp49B9ITKLT1hdYeat1lbR.Ho7SzAlFVLrxAD7ftu0ehnje", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-06-05 22:44:14", last_sign_in_at: "2016-06-05 22:44:14", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Dave ", last_name: "Greenwood", home_port: "Scituate", state: "MA", vessel_name: "Royal Sword", confirmation_token: nil, confirmed_at: "2016-11-11 00:00:00", confirmation_sent_at: nil},
  {email: "abcde@gmail.com", encrypted_password: "$2a$11$4FMa5lYy3aKQe8Mjo3853u23aTAhIMXA8bx8U76UyxnlcmkOpblTK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-06-06 21:37:28", last_sign_in_at: "2016-06-06 21:37:28", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Bob", last_name: "Bob", home_port: "Plymouth", state: "MA", vessel_name: "Today", confirmation_token: nil, confirmed_at: "2016-11-11 00:00:00", confirmation_sent_at: nil},
  {email: "pghrpg@gmail.com", encrypted_password: "$2a$11$MgjMLyRzfBNLpUgYcmswM.DCXnw6dGJlaT6XZ/AwzGsT9SJtT/7Ee", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "philip", last_name: "greenwald", home_port: "", state: "", vessel_name: "", confirmation_token: "4auxEtBw56FZxsMJSGgd", confirmed_at: nil, confirmation_sent_at: "2016-11-11 22:50:24"},
  {email: "currentsfishingnetwork@gmail.com", encrypted_password: "$2a$11$OAgH08GJB3ZEm2HqN1JN3uq06ac0ephZbsjxSKmy8XtTRBq4vBJyK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-11-16 23:34:07", last_sign_in_at: "2016-11-16 22:42:16", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", first_name: "", last_name: "", home_port: "", state: "", vessel_name: "", confirmation_token: "gKYFHTFuTXS7jVBHGM_j", confirmed_at: "2016-11-16 22:42:06", confirmation_sent_at: "2016-11-16 22:39:33"},
  {email: "intel@thefishingnetwork.com", encrypted_password: "$2a$11$8PjpGJgiqRXDwsw6P/5MOeAwlv90tyThlJRsxF2A.ElvU0f2Yxxbm", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, first_name: "a;lkjdf;alsdfjk", last_name: ";lkajdf;alksdjf", home_port: "Plymouth", state: "MA", vessel_name: "ADFLDF", confirmation_token: "RXy3cqRtb9axmezpgRnR", confirmed_at: nil, confirmation_sent_at: "2016-11-23 15:53:25"}
])
ActiveAdmin::Comment.create!([
  {namespace: "admin", body: "heres a comment", resource_id: "4", resource_type: "Report", author_id: 1, author_type: "AdminUser"}
])
Buzz.create!([
  {user_id: 2, post: "adfsdasfsa"},
  {user_id: 2, post: "adfasdflk;aj;lsdkjfal;djkfl;kadjsfl;kajsdfl;kajsdflk;asjdfl;kajsfl;kjasd;lfkjdasl;kfjadkls;"},
  {user_id: 2, post: "Race point is on fire"},
  {user_id: 3, post: "Stellwagen eastd side down to golfball blitz"},
  {user_id: 3, post: "Hi my name is\r\n"},
  {user_id: 3, post: "Today is Thanksgiving"},
  {user_id: 3, post: "blah blah"},
  {user_id: 3, post: "adfadsf"},
  {user_id: 3, post: "asdfasdfasfdasdfasfsa"},
  {user_id: 3, post: "the weather is crappy"},
  {user_id: 3, post: "poia;eklnvianev"},
  {user_id: 3, post: "zxcvbnmcvbnm"},
  {user_id: 3, post: "ffffff"},
  {user_id: 3, post: "this is better"},
  {user_id: 3, post: "This is awesome"},
  {user_id: 3, post: ";lkajsdfl;kjasdf"},
  {user_id: 3, post: ";kjl;askjdfl;kasdf"},
  {user_id: 3, post: "asdfasdfsafas"}
])
