class PurchaseRecordReteiler

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :build_name, :phone_number, :user_id, :product_id, :token
  
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :token
  end
  validates :post_code,presence: true,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, presence: true, format: {with: /\A^0\d{10,11}$\z/}
  def save
   purchase_record = PurchaseRecord.create(user_id: user_id, product_id: product_id)
   Retailer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, build_name: build_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end