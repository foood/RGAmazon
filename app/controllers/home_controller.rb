class HomeController < ApplicationController

  def index
   @books = Book.best_books(4)

  end

end
