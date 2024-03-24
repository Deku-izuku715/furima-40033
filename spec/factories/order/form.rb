FactoryBot.define do
  factory :order_form do
    item_id { 1 }
    user_id { 1 }
    post_code { Faker::Number.leading_zero_number(digits: 3) + "-" + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    construction_name { '日本マンション' }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end