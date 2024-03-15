FactoryBot.define do
  factory :item do
    item_name        {"item"}
    item_describe {"abcd"}
    category_id      {1}
    condition_id     {2}
    send_cost_id        {999}
    prefecture_id    {1}
    arrive_day_id    {1}
    price            {1111111}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
