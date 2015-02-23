class UsersController < ApplicationController
  attr_accessor :avatar_file_name

  def create
    @user = User.create(user_params)
    @user.billing_address.build
    @user.shipping_address.build
  end

  def edit
    @billing_address = current_user.billing_address
    @user = current_user
  end

  def update
    current_user.billing_address.update(update_user_params)
    redirect_to :back, notice: "Billing address has successfully changed"
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar, :billing_address, :shipping_address)
  end
  def update_user_params
    params.require(:address).permit(:zip_code, :address)
  end


end
