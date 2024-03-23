class OrderRecord < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, 
end