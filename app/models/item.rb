class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge, class_name: 'ShippingCharge'
  belongs_to :shipping_from, class_name: 'ShippingFrom'
  belongs_to :shipping_day, class_name: 'ShippingDay'
  validates :image, :name, :description, :price, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

end
