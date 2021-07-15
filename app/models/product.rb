class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :caregory_id
  belongs_to :condition_id
  belongs_to :delivery_destination_id
  belongs_to :prefecture_id
  belongs_to :delivery_date_id

  with_options presence: true do
    validates :name
    validates :description
    validates :user
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :destination_id
      validates :prefecture_id
      validates :delivery_date_id
    end
  end
  validates :price, presence: true, format: {with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range"}
end
