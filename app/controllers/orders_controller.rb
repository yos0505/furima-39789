class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    ShippingAddress.create(shipping_address_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
    render :create, status: :unprocessable_entity
    end
  end

  def order_params
    params.require(:order).permit(:user_id, :item_id).merge(user_id: current_user.id)
  end

  def shipping_address_params
    params.require(:order).permit(shipping_address: [:post_cord, :shipping_from_id, :city, :street_address, :building_name, :phone_number]).fetch(:order, {}).fetch(:shipping_address, {}).merge(order_id: @order.id)
  end
end
