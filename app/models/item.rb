class Item < ApplicationRecord
  with_options presence: true
    validates :item_name
    validates :item_describe
    validates :category_id
    validates :condition_id
    validates :send_cost_id
    validates :prefecture_id
    validates :arrive_day_id
    validates :image
  end
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  belongs_to :user
  #has_one :buy_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :send_cost, :prefecture, :arrive_day

  validates :title, :text, presence: true

  validates :category_id, :condition_id, :send_cost_id, :prefecture_id, :arrive_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end