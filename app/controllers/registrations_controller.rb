class RegistrationsController < Devise::RegistrationsController
	private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_name, :profile_photo)
  end

  def account_update_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_name, :current_password, :profile_photo)
  end
end
