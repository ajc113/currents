FactoryGirl.define do
  factory :state do
    name "MA"
    lat 1.5
    lng 1.51
    visible true
  end

  factory :species, class: 'Species' do
    name "MyString"


    state_waters "MyString"
    located "MyString"
  end
  factory :user do
    id "34"
    email "abc@gmail.com"
    password "abcdef"
    sign_in_count "4"
    state_waters "MA"
    confirmed_at DateTime.now
  end

  factory :buzz do
    user_id "34"
    post "buzzz string"
  end

  factory :admin_user do
    email "admin_rspec@example.com"
    password "password"
    sign_in_count "3"
    confirmed_at = Time.now
  end

  
  factory :location do
    state_waters "MA"
    short_name "dummy_location"
    long_name "dummy_location_for_test"
    coordinate_file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'dummy_location_data.json')) }
  end
 
  factory :report do
    species_id 3
    catch_keepers 20
    catch_total 2323
    date {2.years.ago}
  end

end
