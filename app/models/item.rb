class Item < ApplicationRecord
  belongs_to :user
  has_one :buy_record
end