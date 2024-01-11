class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :shipping_from_id, :city, :street_address, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :post_cord, format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :shipping_from_id, :city, :street_address
  end
end