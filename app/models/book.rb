class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :ratings

  validates :title, presence:{:message => 'title cannot be blank'}
  validates :price, presence: {:message => 'price cannot be blank'}
end
