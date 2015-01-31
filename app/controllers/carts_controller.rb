class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    respond_to do |format|
      format.html
      format.json { render json: @order_items }
    end
  end
end
