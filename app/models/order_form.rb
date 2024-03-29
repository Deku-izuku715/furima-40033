class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street_address, :construction_name, :phone_number, :token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :street_address
    validates :phone_number, format: {with: /\A\d{10,11}\z/,message: "is invalid."}
    validates :token
  end
  def save
    buy_record = BuyRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, construction_name: construction_name, phone_number: phone_number, buy_record_id: buy_record.id)
  end
end