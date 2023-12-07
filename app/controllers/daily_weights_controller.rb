class DailyWeightsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_daily_weight, only: [:edit, :update, :destroy]

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
      # DailyWeightが正常に保存されたら、ProgressChartを作成
      current_user.create_progress_chart unless current_user.progress_chart
      redirect_to root_path, notice: 'Daily weight was successfully created.'
    else
      # 保存失敗時の処理
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @daily_weight = DailyWeight.find_by(id: params[:id])
  end

  def update
    @daily_weight = DailyWeight.find(params[:id])

    if @daily_weight.update(daily_weight_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @daily_weight = DailyWeight.find(params[:id])
    @daily_weight.destroy
    redirect_to root_path
  end

  private

  def daily_weight_params
    params.require(:daily_weight).permit(:current_weight, :current_date).merge(user_id: current_user.id)
  end

  def set_daily_weight
    @daily_weight = DailyWeight.find(params[:id])
  end
end
