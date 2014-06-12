class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :shipping_address_1, :shipping_address_2, :shipping_city, :shipping_state_abr, :shipping_zip)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :shipping_address_1, :shipping_address_2, :shipping_city, :shipping_state_abr, :shipping_zip)
  end
end
