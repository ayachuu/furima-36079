class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :make_product


  def index
    @purchase_record_reteiler = PurchaseRecordReteiler.new
    if current_user == @product.user
      redirect_to root_path
    end
  end

  def create
    @purchase_record_reteiler = PurchaseRecordReteiler.new(purchase_record_reteiler_params)
    if @purchase_record_reteiler.valid?
      pay_item
      @purchase_record_reteiler.save
      return redirect_to root_path
    else
      render :index
    end
    
  end

  private

  def purchase_record_reteiler_params
    params.require(:purchase_record_reteiler).permit(:post_code, :prefecture_id, :city, :address, :build_name, :phone_number, :user_id, :product_id).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end
  def make_product
    @product = Product.find(params[:product_id])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @product[:price], 
      card: purchase_record_reteiler_params[:token],
      currency: 'jpy'
    )
  end

end

