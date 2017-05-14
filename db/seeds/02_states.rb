states = [
  {
    name: "CT",
    lat: 41.21791981422845,
    long: -72.718505859375
  },
  {
    name: "MA",
    lat: 42.02481360781777,
    long: -70.3289794921875
  },
  {
    name: "ME",
    lat: 44.071800467511565,
    long: -72.78717041015625
  },
  {
    name: "NH",
    lat: 42.94234987312984,
    long: -70.67779541015625
  },
  {
    name: "NY",
    lat: 40.711873951908096,
    long: -73.06182861328125
  },
  {
    name: "RI",
    lat: 41.37474755643594,
    long: -71.3287353515625
  },
  {
    name: "Offshore - Gulf of Maine",
    lat: 42.80346172417078,
    long: -69.3621826171875,
    visible: 0
  },
  {
    name: "Offshore - South of New England",
    lat: 40.89275342420696,
    long: -70.97442626953125,
    visible: 0
  },
  {
    name: "Offshore - East of Chatham and Georges Bank",
    lat: 41.430371882652814,
    long: -69.3621826171875,
    visible: 0
  },
  {
    name: "Offshore - Northeast Canyons",
    lat: 39.80853604144591,
    long: -69.642333984375,
    visible: 0
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
