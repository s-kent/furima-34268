class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    if user_signed_in? 
      @product = Product.new      
    else
      redirect_to new_user_session_path      
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :status_id, :shipping_charges_id, :shipping_days_id, :prefecture_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
