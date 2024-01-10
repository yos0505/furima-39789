class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :post_cord, :shipping_from_id, :city, :street_address, :building_name, :phone_number, :order_id, :user_id, :item_id
end