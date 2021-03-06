require 'rails_helper'

RSpec.describe PurchaseRecordReteiler, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchase_record_retailer = FactoryBot.build(:purchase_record_reteiler, user_id: user.id, product_id: product.id)
    sleep 0.5
  end
  describe '発送先情報の登録' do
    context '登録ができるとき' do
      it 'tokenと全ての項目が存在すれば、発送先情報を登録できる' do
        expect(@purchase_record_retailer).to be_valid
      end

      it '建物名は空欄でも登録できる' do
        @purchase_record_retailer.build_name = ''
        expect(@purchase_record_retailer).to be_valid
      end
    end
    context '登録ができないとき' do
      it '郵便番号が空では登録できない' do
        @purchase_record_retailer.post_code = ''
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("Post code can't be blank",
                                                                          'Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号がハイフンがない登録できない' do
        @purchase_record_retailer.post_code = '1111111'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号が全角数字では登録できない' do
        @purchase_record_retailer.post_code = '１１１１１１１'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号が半角英字では登録できない' do
        @purchase_record_retailer.post_code = 'abcdefg'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号が全角英字では登録できない' do
        @purchase_record_retailer.post_code = 'ＡＢＣＤＥＦＧ'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県が空では登録できない' do
        @purchase_record_retailer.prefecture_id = ''
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("Prefecture can't be blank",
                                                                          'Prefecture is not a number')
      end
      it '都道府県が1を選んでも登録できない' do
        @purchase_record_retailer.prefecture_id = 1
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が空では登録できない' do
        @purchase_record_retailer.city = ''
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @purchase_record_retailer.address = ''
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @purchase_record_retailer.phone_number = ''
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("Phone number can't be blank",
                                                                          'Phone number is invalid')
      end
      it '電話番号が9桁以下でないと登録できない' do
        @purchase_record_retailer.phone_number = '123456789'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が11桁以上では登録できない' do
        @purchase_record_retailer.phone_number = '12345678901'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が英数混合では登録できない' do
        @purchase_record_retailer.phone_number = '123456abcd'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Phone number is invalid')
      end

      it '郵便番号が全角数字では登録できない' do
        @purchase_record_retailer.phone_number = '１２３４５６７８９０１'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Phone number is invalid')
      end
      it '郵便番号が半角英字では登録できない' do
        @purchase_record_retailer.phone_number = 'abcdefghij'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Phone number is invalid')
      end
      it '郵便番号が全角英字では登録できない' do
        @purchase_record_retailer.phone_number = 'ＡＢＣＥＦＧＨＩＪ'
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空では登録できないこと' do
        @purchase_record_retailer.user_id = nil
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では登録できないこと' do
        @purchase_record_retailer.product_id = nil
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空では登録できない' do
        @purchase_record_retailer.token = nil
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
