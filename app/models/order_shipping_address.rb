class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :shipping_from_id, :city, :street_address, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_cord, format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :shipping_from_id, :city, :street_address
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(post_cord: post_cord, shipping_from_id: shipping_from_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
end
