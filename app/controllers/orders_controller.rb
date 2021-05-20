class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_destination = OrderDestination.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
