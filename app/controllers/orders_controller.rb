class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
    @order_shipping_address = OrderShippingAddress.new
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if  @order_shipping_address.valid?
       pay_item
       @order_shipping_address.save
       redirect_to root_path
    else
       gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
       render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:post_cord, :shipping_from_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
     )
    end
end
