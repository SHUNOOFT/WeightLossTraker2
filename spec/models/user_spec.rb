require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系テスト' do
      it '全ての項目が正しい場合、登録できること' do
        expect(@user).to be_valid
      end
    end

    context '異常系テスト' do
      it 'usernameが空では登録できない' do
        @user.username = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Username can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'target_weightが空では登録できない' do
        @user.target_weight = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Target weight can't be blank")
      end
      it 'target_dateが空では登録できない' do
        @user.target_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Target date can't be blank")
      end
    end
  end
end
