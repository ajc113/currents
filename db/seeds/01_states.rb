states = [
  {
    name: "CT",
    lat: 41.21791981422845,
    lng: -72.718505859375,
    zoom: 9
  },
  {
    name: "MA",
    lat: 42.02481360781777,
    lng: -70.3289794921875,
    zoom: 8

  },
  {
    name: "ME",
    lat: 43.96909818325171,
    lng: -68.609619140625,
    zoom: 8

  },
  {
    name: "NH",
    lat: 42.94234987312984,
    lng: -70.67779541015625,
    zoom: 10

  },
  {
    name: "NY",
    lat: 40.711873951908096,
    lng: -73.06182861328125,
    zoom: 9

  },
  {
    name: "RI",
    lat: 41.37474755643594,
    lng: -71.3287353515625,
    zoom: 9

  },
  {
    name: "Offshore - Gulf of Maine",
    lat: 42.80346172417078,
    lng: -69.3621826171875,
    visible: 0,
    zoom: 9

  },
  {
    name: "Offshore - South of New England",
    lat: 40.89275342420696,
    lng: -70.97442626953125,
    visible: 0,
    zoom: 9

  },
  {
    name: "Offshore - East of Chatham and Georges Bank",
    lat: 41.430371882652814,
    lng: -69.3621826171875,
    visible: 0,
    zoom: 9

  },
  {
    name: "Offshore - Northeast Canyons",
    lat: 39.80853604144591,
    lng: -69.642333984375,
    visible: 0,
    zoom: 8

  }
]

states.each do |state|
  begin
    State.create!(state)
    print '.'
  rescue
    ActiveRecord::RecordInvalid
    print 'F'
  end
end
puts "#{State.count} states created"
