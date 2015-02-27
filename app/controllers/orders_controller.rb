class OrdersController < ApplicationController

  def edit
    @user = current_user
    @order = current_order
    @order.shipping_address_id = @user.shipping_address.id
    @order.billing_address_id = @user.billing_address.id
    #current_user.shipping_address = current_user.billing_address if params[:checkbox_use_same_address] == true
  end
  private
  def order_params
    params.require(:order).permit(:user_id, :status, :billing_address_id, :shipping_address_id )
  end
end
