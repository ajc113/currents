FactoryBot.define do
  factory :state do
    name {  
      [
       "CT",
       "MA",
       "ME",
       "NH",
       "NY",
       "RI",
       "Offshore - Gulf of Maine",
       "Offshore - South of New England",
       "Offshore - East of Chatham and Georges Bank",
       "Offshore - Northeast Canyons"
      ].sample
    }
    lat { 1.5 }
    lng { 1.51 }
    visible { true }
    initialize_with { State.find_or_create_by(name: name) }
  end
end
