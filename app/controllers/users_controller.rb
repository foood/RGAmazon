class UsersController < ApplicationController
  attr_accessor :avatar_file_name

  def create
    @user = User.create(user_params)
  end

  def edit
    @user = current_user
    @billing_address = BillingAddress.find_or_create_by(address_type: 'Billing',user_id: current_user.id)
    @shipping_address = ShippingAddress.find_or_create_by(address_type: 'Shipping',user_id: current_user.id)
    #current_user.shipping_address = current_user.billing_address if params[:checkbox_use_same_address] == true

  end

  def update
    @user = User.find_by(id: current_user.id)
   # @user.update_attributes(user_params)
    @user.update_attributes(user_params)
    redirect_to :back, notice: "Billing address has successfully changed"
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar, {shipping_address:[:zip_code, :address, :id]}, {billing_address:[:zip_code, :address, :id]})
  end
  def update_user_params
    params.require(:user).permit(shipping_address_attributes:[:zip_code, :address, :id], billing_address_attributes:[:zip_code, :address, :id])
  end


end
