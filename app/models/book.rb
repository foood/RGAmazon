class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :ratings, through: :customers
  has_many :order_items

  validates :title, presence: {:message => 'title cannot be blank'}
  validates :price, presence: {:message => 'price cannot be blank'}
  validates :stock, presence: {:message => 'stock cannot be blank'}
end
