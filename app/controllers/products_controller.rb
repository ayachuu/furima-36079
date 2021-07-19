class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @product = Product.order(id: 'DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render new_product_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition_id, :delivery_destination_id, :prefecture_id,
                                    :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
