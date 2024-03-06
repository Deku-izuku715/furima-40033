FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2)}
    email                 { Faker::Internet.email}
    password              { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '佐藤' }
    first_name            { '二郎' }
    last_name_kana        { 'サトウ' }
    first_name_kana       { 'ジロウ' }
    birth_date            { Faker::Date.birthday }
  end
end