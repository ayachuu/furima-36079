class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_destination
  belongs_to :prefecture
  belongs_to :delivery_date

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :user_id 
    validates :image 
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :delivery_destination_id
      validates :prefecture_id
      validates :delivery_date_id
    end
  end
  validates :price, presence: true, format: {with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range"}
end
