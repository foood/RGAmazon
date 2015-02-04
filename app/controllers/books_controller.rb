class BooksController < ApplicationController

  def index
    if params[:category]
      @books = Book.where(category_id: params[:category])
    else
      @books = Book.all
    end
    @order_item = current_order.order_items.new

    respond_to do |format|
      format.html
      format.json { render json: @books && @order_item }

    end
  end


  def book_params
    params.require(:book).permit(:title, :author, :category, :price, :stock, :description,:image)
  end


  def show
    @book = Book.find(params[:id])
  end


end
