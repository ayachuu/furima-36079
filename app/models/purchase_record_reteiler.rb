class PurchaseRecordRetailer
  include ActiveModel::module
  attr_acceser :user_id, :product_id, :post_code, :prefecture_id, :city, :address, :build_name, :phone_number, :purchase_record_id
  with_options presence: true do
    validates :user_id,
    validates :product_id,
    validates :post_code,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,
    validates :city,
    validates :address,
    validates :phone_number, format: {with: ^0\d{10,11}$}
    validates :purchase_record_id
  end

  def save
   purchase_rcord = PurchaseRecord.create(user_id: use_id, product_id: product_id)
   Retailer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, build_name: build_name, :phone_number, :purchase_record_id)
  end
end