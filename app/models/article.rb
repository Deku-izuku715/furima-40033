class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :send_cost, :prefecture, :arrive_day

  validates :title, :text, presence: true

  validates :category_id, :condition_id, :send_cost_id, :prefecture_id, :arrive_day_id, numericality: { other_than: 1 , message: "can't be blank"}
end
