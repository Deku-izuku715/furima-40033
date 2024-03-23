class OrderRecordFrom
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :street_address, :construction_name, :phone_numaber

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numereicality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :street_address
    validates :phone_number, format: {with: /\A\d{10,11}\z/,message: "is invalid. Includehyphen(-)"}
  end

  def save(params,user_id)
    order = OrderRecord.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_adress, construction_name: construction_name, :phone_number: phone_number, order_id: order_id)
  end
end