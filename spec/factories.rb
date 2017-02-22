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
end
