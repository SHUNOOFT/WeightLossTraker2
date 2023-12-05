class DailyWeightsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @daily_weights = DailyWeight.all
    @user = current_user 
  end

  def new
    @user = User.new
  end

  def create
    @daily_weight = DailyWeight.new(daily_weight_params)
  
    if @daily_weight.save
      redirect_to root_path
    else
      # 保存失敗時の処理
      render :new, status: :unprocessable_entity
    end
  end

  private

  def daily_weight_params
    params.require(:daily_weight).permit(:current_weight, :current_date).merge(user_id: current_user.id)
  end
end
