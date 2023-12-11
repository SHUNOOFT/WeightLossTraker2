require 'rails_helper'

RSpec.describe DailyWeight, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @daily_weight = FactoryBot.build(:daily_weight, user: @user, current_date: Date.today, current_weight: 70.0)
  end

  describe 'バリデーション' do
    context '正常系テスト' do
      it '有効な属性がある場合、有効であること' do
        expect(@daily_weight).to be_valid
      end
    end

    context '異常系テスト' do
      it 'current_dateが未入力の場合、無効であること' do
        @daily_weight.current_date = nil
        @daily_weight.valid?
        expect(@daily_weight.errors.full_messages).to include("Current date can't be blank")
      end

      it 'current_weightが未入力の場合、無効であること' do
        @daily_weight.current_weight = nil
        @daily_weight.valid?
        expect(@daily_weight.errors.full_messages).to include("Current weight can't be blank")
      end

      it 'current_dateがuserのtarget_dateより未来の日付の場合、無効であること' do
        future_date = @user.target_date + 1.day
        @daily_weight.current_date = future_date
        @daily_weight.valid?
        expect(@daily_weight.errors[:current_date]).to include('can not be in the future then your target date.If you want to proceed tracking your weight, go to your account information and edit your target weight.')
      end
    end
  end
end
