require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        # email 一意性
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'hogefuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password 英字と数字の両方を含めて設定してください',
                                                      "Password confirmation doesn't match Password")
      end

      it 'paswordとpassword_confirmationは、5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、数字だけでは登録できない' do
        @user.password = '１２３４５６'
        @user.password_confirmation = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end

      it 'パスワードは、英字だけでは登録できない' do
        @user.password = 'asdfgh'
        @user.password_confirmation = 'asdfgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end

      it 'パスワードは、全角だけでは登録できない' do
        @user.password = 'ａｓｄｆｇｈ'
        @user.password_confirmation = 'ａｓｄｆｇｈ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end

      it 'paswordとpassword_confirmationの値が不一致では登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'family_nameは空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name 全角文字を使用してください')
      end

      it 'last_nameは空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
      end

      it 'family_nameは全角での入力でなければ登録できない' do
        @user.family_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end
      it 'last_nameは全角での入力でなければ登録できない' do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'family_name_kanaは空だと登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", 'Family name kana 全角文字を使用してください')
      end

      it 'last_name_kanaは空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana 全角文字を使用してください')
      end
      it 'family_name_kanaは全角カタカナでの入力でなければ登録できない' do
        @user.family_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana 全角文字を使用してください')
      end
      it 'last_name_kanaは全角カタカナでの入力でなければ登録できない' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角文字を使用してください')
      end

      it '生年月日が必須' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
