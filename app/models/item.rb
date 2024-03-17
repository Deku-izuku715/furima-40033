class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_describe
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :send_cost_id
      validates :prefecture_id
      validates :arrive_day_id
    end
  end
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  belongs_to :user
  has_many :articles
  #has_one :buy_record
  has_one_attached :image
end