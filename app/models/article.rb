class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :send_cost
  belongs_to :prefecture
  belongs_to :arrive_day
  validates :title, :text, presence: true
  validates :category_id, :condition_id, :send_cost_id, :prefecture_id, :arrive_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end