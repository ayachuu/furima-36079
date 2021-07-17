class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_destination
  belongs_to :prefecture
  belongs_to :delivery_date

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :user
    validates :image
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :delivery_destination_id
      validates :prefecture_id
      validates :delivery_date_id
    end
  end
  validates :name, presence: true, length: { maximum: 40, message: '商品名 は40文字以内で入力してください' }
  validates :description, presence: true, length: { maximum: 1000, message: '商品の説明は1,000文字以内で入力してください' }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "半角数値で入力してください"},
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'out of setting range' }
end
