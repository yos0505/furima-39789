class ItemesController < ApplicationController
  before_action :authenticate_user!, only: [:new], unless: :user_signed_in?

  def index
  end

  def new
    @iteme = Iteme.new
  end

  def create
    @iteme = Iteme.new(iteme_params)
    if iteme.save
      redirect_to iteme_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def iteme_params
    params.require(:iteme).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :shipping_from_id, :shipping_day_id, :price)
end

  
