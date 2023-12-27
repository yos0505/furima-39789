class Iteme < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_charge, :shipping_from, :shipping_day
  validates :name, :description, :price, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
