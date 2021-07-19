class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_path, only: [:edit, :update]

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

  def update
    if @product.update(product_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :condition_id, :delivery_destination_id, :prefecture_id,
                                    :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_path
    @product = Product.find(params[:id])
    redirect_to action: :index unless current_user.id == @product.user_id
  end
end
