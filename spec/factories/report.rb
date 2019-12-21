FactoryBot.define do
  factory :report do
    species
    user
    catch_keepers { 20 }
    catch_total { 2323 }
    date {2.years.ago}
    location
    state
     factory :report_without_validation do
       to_create {|instance| instance.save(validate: false) }
     end
  end
end
