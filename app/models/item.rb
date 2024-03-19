class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  belongs_to :user
  #has_one :buy_record
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :send_cost
  belongs_to :prefecture
  belongs_to :arrive_day
end