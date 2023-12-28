class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new], unless: :user_signed_in?

  def index
    @items = Item.order("created_at DESC")

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if item.save
      redirect_to item_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id, :price)
end
end
