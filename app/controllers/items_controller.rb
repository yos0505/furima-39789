class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit], unless: :user_signed_in?
  before_action :move_to_index, only: [:edit]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id, :price).merge(user_id: current_user.id)
end

def move_to_index
item = Item.find(params[:id])
redirect_to root_path unless user_signed_in? && current_user == item.user
end
end
