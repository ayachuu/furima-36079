class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_reteiler = PurchaseRecordReteiler.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_record_reteiler = PurchaseRecordReteiler.new(purchase_record_reteiler_params)
    if @purchase_record_reteiler.valid?
      @purchase_record_reteiler.save
      redirect_to root_path
    else
      render :index
    end
    
  end

  private

  def purchase_record_reteiler_params
    params.require(:purchase_record_reteiler).permit(:post_code, :prefecture_id, :city, :address, :build_name, :phone_number, :user_id, :product_id).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end

