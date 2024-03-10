class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_describe, presence: true
  validates :category_id, presence: true
  validates :conditoin_id, presence: true
  validates :send_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :arrive_day_id, presence: true
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal: 9_999_999 },
  end
  belongs_to :user
  has_one :buy_record
  has_one_attached :image
end