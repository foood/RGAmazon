class BooksController < ApplicationController

  def index
    @books = Book.all
    @order_item = current_order.order_items.new

    respond_to do |format|
      format.html
      format.json { render json: @books && @order_item }

    end
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new", notice: 'asd' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :category, :price, :stock, :description,:image)
  end
  def new
    @book = Book.new

    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def edit
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroy.' }
      format.json { head :no_content }
    end
  end
  def author

  end

end
