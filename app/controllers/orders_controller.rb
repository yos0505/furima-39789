class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @oder = Oder.new
  end


  def create
  end
  
end
