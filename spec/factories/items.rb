FactoryBot.define do
  factory :item do
    title            {"title"}
    text             {"text"}
    item_name        {"item"}
    item_describe {"abcd"}
    category_id      {2}
    condition_id     {2}
    send_cost_id        {999}
    prefecture_id    {2}
    arrive_day_id    {2}
    price            {1111111}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
