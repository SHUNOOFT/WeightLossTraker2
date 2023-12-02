class DailyWeightsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @daily_weights = DailyWeight.all
    @user = current_user 
  end

  def new
    @user = User.new
    @user.target_weight = 70 
  end

end
