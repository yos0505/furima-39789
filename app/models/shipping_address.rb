class ShippingAddress < ApplicationRecord
  belongs_to :order
  with_options presence: true do
    validates :post_cord, format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
  validates :shipping_from_id, :city, :street_address, presence: true
end