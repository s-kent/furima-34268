class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :move_to_index

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_product
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    if current_user.id == @product.user_id || @product.order.present? 
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
