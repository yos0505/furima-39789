class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @oder = Oder.new
  end


  def create
    @oder = Oder.create(oder_params)
    Shipping_address.create(shipping_address_params)
    redirect_to root_path
  end

  def order_params
    params.require(:order).permit(:user, :item).merge(user_id: current_user.id)
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:post_cord, :shipping_from_id, :city, :street_address, :phone_number, :order).merge(order_id: @order.id)
  end
  
end
