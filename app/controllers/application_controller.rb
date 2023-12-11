class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :target_weight, :target_date])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :target_weight, :target_date])
  end
end
