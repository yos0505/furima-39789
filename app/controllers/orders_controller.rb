class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if  @order_shipping_address.valid?
       @order_shipping_address.save
       redirect_to root_path
    else
       render :create, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:post_cord, :shipping_from_id, :city, :street_address, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
