class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_from
  belongs_to :shipping_day
  validates :image, :name, :description, :price, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
