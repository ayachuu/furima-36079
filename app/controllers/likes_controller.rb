class LikesController < ApplicationController
  before_action :set_product
  def create
    Like.create(user_id: current_user.id, product_id: params[:id])
    redirect_to product_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, product_id: params[:id]).destroy
    redirect_to product_path
  end
  private

  def set_product
    @product = Product.find(params[:id])
  end

end