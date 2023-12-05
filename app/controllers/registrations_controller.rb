class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def destroy
    if current_user.destroy
      sign_out current_user
      redirect_to root_path, notice: 'Your account has been successfully deleted.'
    else
      redirect_to edit_user_registration_path, alert: 'Failed to delete your account.'
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to edit_user_registration_path
    end
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :target_weight, :target_date])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :target_weight, :target_date, :current_password])
  end

  def resource_name
    :user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :target_weight, :target_date)
  end
end