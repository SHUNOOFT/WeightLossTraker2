class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :destroy_account, only: [ :destroy]

  def destroy
    destroy_account
  end

  private
  def destroy_account
    if current_user.destroy
      sign_out current_user
      redirect_to root_path, notice: 'Your account has been successfully deleted.'
    else
      redirect_to edit_user_registration_path, alert: 'Failed to delete your account.'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :target_weight, :target_date])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :target_weight, :target_date])
  end
end