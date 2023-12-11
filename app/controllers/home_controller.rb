class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    @daily_weight = current_user.daily_weights.order(created_at: :desc).first
  end
end
