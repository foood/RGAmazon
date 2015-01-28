class Author < ActiveRecord::Base
  has_many :books

  validates :first_name, presence: true
  validates :last_name, presence: true
  def full_name
    "#{first_name.first}. #{last_name}"
  end
end
