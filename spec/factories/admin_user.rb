FactoryBot.define do
  factory :admin_user do
    email { "admin_rspec@example.com" }
    password { "password" }
    sign_in_count { "3" }
    confirmed_at = Time.now
  end
end
