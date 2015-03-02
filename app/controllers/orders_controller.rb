class OrdersController < ApplicationController

  def edit
    @user = current_user
    @order = current_order
    @order.shipping_address_id = @user.shipping_address.id
    @order.billing_address_id = @user.billing_address.id
    #current_user.shipping_address = current_user.billing_address if params[:checkbox_use_same_address] == true
  end

  def update

    current_order.update_attributes(update_order_params)
    current_order.shipping_address.attributes = current_order.billing_address.attributes.except("id", "updated_at", "created_at")  if params[:bill_to_shipp == 1]
    redirect_to :back, notice: "Billing address has successfully changed"
  end

  private


  def update_order_params
    params.require(:order).permit(:bill_to_shipp, shipping_address_attributes:
                                     [:address, :zip_code, :city, :phone, :first_name, :last_name, :country_id, :id],
                                 billing_address_attributes:
                                     [:address, :zip_code, :city, :phone, :first_name, :last_name,:country_id, :id])
  end
  def order_params
    params.require(:order).permit(:user_id, :status, :billing_address_id, :shipping_address_id )
  end
end
