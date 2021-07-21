require 'rails_helper'

RSpec.describe Retailer, type: :model do
  before do
    @retailer = FactoryBot.build(:retailer)
  end
  describe "発送先情報の登録" do
    context "登録ができるとき" do
      it "全ての項目が存在すれば、発送先情報を登録できる" do
        expect(@retailer).to be_valid
      end

    end
  end
end

#     context "登録ができないとき"
#     end

#   end
#   配送先の住所情報も購入の都度入力させること。
# 郵便番号が必須であること。
# 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
# 都道府県が必須であること。
# 市区町村が必須であること。
# 番地が必須であること。
# 建物名は任意であること。
# 電話番号が必須であること。
# 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。

