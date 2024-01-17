class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_shipping_address = OrderShippingAddress.new
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if  @order_shipping_address.valid?
      Payjp.api_key = "sk_test_f9f13abea01fb57d94e1acf3"
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
       @order_shipping_address.save
       redirect_to root_path
    else
       render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:post_cord, :shipping_from_id, :city, :street_address, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
