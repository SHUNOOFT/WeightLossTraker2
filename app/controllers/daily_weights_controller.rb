class DailyWeightsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_daily_weight, only: [:edit, :update, :destroy]

  def index
    @daily_weights = current_user.daily_weights.order(current_date: :asc)
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @daily_weight = DailyWeight.find_by(id: params[:id])
  end

  def update
    if @daily_weight.update(daily_weight_params)
      update_or_create_progress_chart(@daily_weight)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    if @daily_weight.destroy
      remove_weight_from_progress_chart(@daily_weight)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def daily_weight_params
    params.require(:daily_weight).permit(:current_weight, :current_date).merge(user_id: current_user.id)
  end

  def set_daily_weight
    @daily_weight = DailyWeight.find(params[:id])
  end

  def update_or_create_progress_chart(daily_weight)
    progress_chart = current_user.progress_chart || current_user.create_progress_chart
    progress_chart.update_chart_data(daily_weight)
  end

  def remove_weight_from_progress_chart(daily_weight)
    progress_chart = current_user.progress_chart
    progress_chart.remove_chart_data(daily_weight.current_date) if progress_chart
  end
end
