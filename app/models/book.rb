class Book < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :author
  has_many :ratings
  has_many :order_items, dependent: :destroy


  before_save :uncategorized, :no_author
  validates :title, presence: {:message => 'Title cannot be blank'}
  validates :price, presence: {:message => 'Price cannot be blank'}
  validates :stock, presence: {:message => 'Stock cannot be blank'}

  @number_of_best_books = 4

  def no_author
    Author.find_or_create_by(first_name: 'john') do |author|
      author.first_name = 'john'
      author.last_name = 'doe'
    end
    self.author = Author.find_by(first_name: 'john' ) if self.category == nil
  end

  def uncategorized
    Category.find_or_create_by(title: 'Uncategorized')
    self.category = Category.find_by_title('Uncategorized') if self.category == nil
  end



  def self.best_books
    @books = Book.select('books.id', 'sum(quantity) as qty')
                 .joins(:order_items)
                 .group('books.id')
                 .order('qty DESC')
                 .limit(@number_of_best_books)

    where(id: @books.take(@number_of_best_books)).reverse

  end
end
