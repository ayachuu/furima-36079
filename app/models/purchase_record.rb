class PurchaseRecord < ApplicationRecord
  has_many :retaier
  belongs_to :user
  belongs_to :product
end
