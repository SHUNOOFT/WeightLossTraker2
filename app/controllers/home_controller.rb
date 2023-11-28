class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, except: [:index]

  def index
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
