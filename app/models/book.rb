class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :ratings
  has_many :order_items

  validates :title, presence: {:message => 'Title cannot be blank'}
  validates :price, presence: {:message => 'Price cannot be blank'}
  validates :stock, presence: {:message => 'Stock cannot be blank'}
end
