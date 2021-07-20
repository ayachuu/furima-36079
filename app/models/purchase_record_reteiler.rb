class PurchaseRecordReteiler
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :prefecture_id, :city, :address, :build_name, :phone_number, :purchase_record_id
  with_options presence: true do
    validates :user
    validates :product
    validates :prefecture_id
    validates :city
    validates :address
    validates :purchase_record_id
  end
  validates :post_code,presence: true,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, presence: true, format: {with: /\A^0\d{10,11}$\z/}
  validates :phone_number, format: {with: /\A^0\d{10,11}$\z/}

  def save
   purchase_rcord = PurchaseRecord.create(user_id: use_id, product_id: product_id)
   Retailer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, build_name: build_name, phone_nmber: phone_number, purchase_record_id: purchase_record_id)
  end
end