class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
  end
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: :index
    else
      render :new
    end
  end


  private
  def product_params
    params[:product].permit(:name, :description, :category_id, :condition_id, :delivery_destination_id, :prefecture_id, :derivery_date_id, :price).merge(user_id: current_user.id)
  end
end

