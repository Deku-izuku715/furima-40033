FactoryBot.define do
  factory :user do
    nickname              {'namae'}
    email                 {'sample@mail'}
    password              {'000aaa'}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'二郎'}
    last_name_kana        {'サトウ'}
    first_name_kana       {'ジロウ'}
    birth_date            {'2002-02-02'}
  end
end