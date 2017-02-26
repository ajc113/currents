FactoryGirl.define do
  factory :user do
    id "34"
    email "abc@gmail.com"
    password "abcdef"
    sign_in_count "4"
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
    catch_total 2323
  end

  factory :location do
    short_name "dummy_location"
    long_name "dummy_location_for_test"
    coordinate_file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'dummy_location_data.json')) }
  end
end
