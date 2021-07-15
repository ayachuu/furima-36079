class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :caregory_id, :condition_id, :delivery_destination_id, :prefecture_id, :delivery_date_id

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :user
    with_optins numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :destination_id
      validates :prefecture_id
      validates :delivery_date_id
    end
  end
end
