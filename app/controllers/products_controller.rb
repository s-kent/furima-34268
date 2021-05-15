class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :status_id, :shipping_charges_id, :shipping_days_id, :prefecture_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @product = Product.find(params[:id])
    unless user_signed_in? && current_user.id == @product.user_id
      redirect_to action: :index
    end
  end

end
