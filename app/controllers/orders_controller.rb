class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
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

  def order_params
    params.require(:order_shipping_address).permit(:post_cord, :shipping_from_id, :city, :street_address, :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end

end
