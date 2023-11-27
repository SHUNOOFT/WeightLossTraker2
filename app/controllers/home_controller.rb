class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, except: [:index]

  def index
  end
end
