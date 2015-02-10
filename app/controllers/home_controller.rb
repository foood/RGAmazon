class HomeController < ApplicationController

  def index
   @books = Book.best_books

  end

end
