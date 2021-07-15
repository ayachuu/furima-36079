class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' } do
    validates :family_name_kana
    validates :last_name_kana
  end
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: '英字と数字の両方を含めて設定してください' }
end
