require 'rails_helper'

RSpec.describe PurchaseRecordReteiler, type: :model do
  before do
    @purchase_record_retailer = FactoryBot.build(:purchase_record_reteiler)
  end
  describe '発送先情報の登録' do
    context '登録ができるとき' do
      it 'tokenと全ての項目が存在すれば、発送先情報を登録できる' do
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
      it 'tokenが空では登録できない' do
        @purchase_record_retailer.token = nil
        @purchase_record_retailer.valid?
        expect(@purchase_record_retailer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
