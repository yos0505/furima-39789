class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new], unless: :user_signed_in?

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  if edit
    @item = Item.find(params[:id])
  end

  if update
  end


  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id, :price).merge(user_id: current_user.id)
end
end
