class Item < ApplicationRecord
  belongs_to :user
  has_one :buy_record
  has_one_attached :image
end