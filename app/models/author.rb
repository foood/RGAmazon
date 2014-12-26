class Author < ActiveRecord::Base
  has_many :books

  validates :firstname, presence: true
  validates :lastname, presence: true
end
