FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { "abcdef" }
    sign_in_count { "4" }
    state
    confirmed_at { DateTime.now }

    factory :non_customer do
      stripe_customer_id { "" }
    end

    factory :stripe_customer do
      stripe_customer_id { FakeStripe::CUSTOMER_ID }
      payment_source { "src_1BDT3BLl1LzrhllYSAFu2MMu" }
    end
  end
end
