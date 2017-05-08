FactoryGirl.define do
  factory :state do
    name "MyString"
    lat 1.5
    long 1.5
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
    state "MA"
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

  factory :report do
    species_id 3
    location_id 4
    catch_keepers 20
    catch_total 2323
    date {2.years.ago}
  end

  factory :location do
    short_name "dummy_location"
    long_name "dummy_location_for_test"
    coordinate_file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'dummy_location_data.json')) }
  end
end
