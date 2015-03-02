class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    respond_to do |format|
      format.html
      format.json { render json: @order_items }
    end
  end
  def empty
    current_order.order_items.destroy_all

    redirect_to :back, notice: "Your cart empty"

  end
end
