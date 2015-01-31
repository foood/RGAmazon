class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :ratings
  has_many :order_items, dependent: :destroy

  before_create :no_author
  before_create :uncategorized
  validates :title, presence: {:message => 'Title cannot be blank'}
  validates :price, presence: {:message => 'Price cannot be blank'}
  validates :stock, presence: {:message => 'Stock cannot be blank'}

  def no_author
    Author.find_or_create_by(first_name: 'john') do |author|
      author.last_name = 'doe'
    end
    self.author = Author.find_by(first_name: 'john' )
  end

  def uncategorized
    Category.find_or_create_by(title: 'Uncategorized')
    self.category = Category.find_by_title('Uncategorized')
  end
end
