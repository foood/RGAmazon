class HomeController < ApplicationController

  def index
   @books = ten_best_books

  end


  def all_books_orders
    all_books_orders  =  Hash.new(0)
    @order_items = OrderItem.all

    @order_items.select  { |order_items|  order_items.book_id }.map  { |order_items|  all_books_orders[order_items.book_id] += 1 }

    all_books_orders
  end

  def ten_best_books
    @books = Book.all

    best_books = all_books_orders.sort_by { |k,  v| v }

    best_books.first(2).collect { |k, v|  @books.find_by(id: k)}

  end

end
