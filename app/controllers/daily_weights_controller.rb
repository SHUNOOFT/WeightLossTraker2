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
    @daily_weight = current_user.daily_weights.new(daily_weight_params)

    if @daily_weight.save
      # ProgressChart のデータを作成し、グラフを更新するロジックを呼び出す
      update_or_create_progress_chart(@daily_weight)
      redirect_to root_path
    else
      render :new
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

  def update_or_create_progress_chart(daily_weight)
    progress_chart = current_user.progress_chart

    if progress_chart.nil?
      # ProgressChartが存在しない場合は新しく作成
      progress_chart = ProgressChart.create(user: current_user)
    end
    # DailyWeightのデータを使ってProgressChartを更新
    progress_chart.update_chart_data(daily_weight.current_date, daily_weight.current_weight)
  end
end
