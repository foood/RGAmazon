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


  def no_author
    if self.author == nil
      Author.find_or_create_by(first_name: 'john') do |author|
        author.first_name = 'john'
        author.last_name = 'doe'
      end
      self.author = Author.find_by(first_name: 'john' )
    end
  end

  def uncategorized
    if self.category == nil
      Category.find_or_create_by(title: 'Uncategorized')
      self.category = Category.find_by_title('Uncategorized')
    end
  end



  def self.best_books(count)
    @book_id = select('books.id', 'sum(quantity) as qty')
             .joins(:order_items)
             .group('books.id')
             .order('qty DESC')
             .limit(count)
    where(id: @book_id.take(count)).reverse

  end
end
