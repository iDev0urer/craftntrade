class RegistrationsController < Devise::RegistrationsController

  def sign_up_params
    params.require(:user).permit(:first_name, :middle_initial, :last_name, :email, :username, :password, :password_confirmation, :mailing_list)
  end

end
