class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address
  validates :user, presence: true
  validates :item, presence: true
end
