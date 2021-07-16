require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe "商品の登録" do
    context "商品の登録ができる" do
      it "全ての項目が存在すれば、商品の登録ができる" do
        expect(@product).to be_valid
      end
    end


    context "商品の登録ができないとき" do
        @product.image= nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では登録できない" do
        @product.name= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空では登録できない" do
        @product.description= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it "商品の詳細カテゴリーが空では登録できない" do
        @product.category_id= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank", "Category can't be blank")
      end
      it "商品の状態が空では登録できない" do
        @product.condition_id= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank", "Condition can't be blank")
      end
      it "配送料の負担が空では登録できない" do
        @product.delivery_destination_id= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery destination can't be blank", "Delivery destination can't be blank")
      end
      it "発送元の地域が空では登録できない" do
        @product.prefecture_id= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
      end
      it "発送までの日数が空では登録できない" do
        @product.delivery_date_id= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery date can't be blank", "Delivery date can't be blank")
      end
      it "販売価格が空では登録できない" do
        @product.price= ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price out of setting range")
      end
    

    end
  end
end