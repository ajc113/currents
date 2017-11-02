FactoryGirl.define do
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
    lat 1.5
    lng 1.51
    visible true
    initialize_with { State.find_or_create_by(name: name) }
  end

  factory :species, class: 'Species' do
    name "MyString"
    state_waters "MyString"
    located "MyString"
  end

  factory :user do
    email { FFaker::Internet.email }
    password "abcdef"
    sign_in_count "4"
    state
    confirmed_at DateTime.now

    factory :non_customer do
      stripe_customer_id ""
    end

    factory :stripe_customer do
      stripe_customer_id { FakeStripe::CUSTOMER_ID }
      payment_source "src_1BDT3BLl1LzrhllYSAFu2MMu"
    end
  end

  factory :buzz do
    post "buzzz string"
    user
  end

  factory :admin_user do
    email "admin_rspec@example.com"
    password "password"
    sign_in_count "3"
    confirmed_at = Time.now
  end

  
  factory :location do
    state
    short_name "dummy_location"
    long_name "dummy_location_for_test"
    coordinate_file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'dummy_location_data.json')) }
  end
 
  factory :report do
    species_id 3
    catch_keepers 20
    catch_total 2323
    date {2.years.ago}
    location
    state
     factory :report_without_validation do
       to_create {|instance| instance.save(validate: false) }
     end
  end

end
