class OrdersController < ApplicationController


  private
  def order_params
    params.require(:order).permit(:user_id, :status, :billing_address_id, :shipping_address_id )
  end
end
