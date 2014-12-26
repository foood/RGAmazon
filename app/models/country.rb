class Country < ActiveRecord::Base
  has_many :adresses

  validates :name, presence: true, uniqueness: true
end
