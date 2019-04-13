FactoryBot.define do
  factory :location do
    state
    short_name { "dummy_location" }
    long_name { "dummy_location_for_test" }
    coordinate_file { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'dummy_location_data.json')) }
  end
end
