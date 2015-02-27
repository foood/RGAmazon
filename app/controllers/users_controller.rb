class UsersController < ApplicationController
  attr_accessor :avatar_file_name

  def create
    @user = User.create(user_params)
  end

  def edit
    @user = current_user

  end

  def update

    current_user.update_attributes(update_user_params)
    redirect_to :back, notice: "Billing address has successfully changed"
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar, [:shipping_address, :billing_address])
  end
  def update_user_params
    params.require(:user).permit(:email, :current_password, :password, :password_confirmation,
                                 shipping_address_attributes:
                                     [:address, :zip_code, :city, :phone, :first_name, :last_name, :country_id, :id],
                                 billing_address_attributes:
                                     [:address, :zip_code, :city, :phone, :first_name, :last_name,:country_id, :id])
  end


end
