class CreditCard < ActiveRecord::Base
  belongs_to :customer
  has_many :orders

  validates :ccv, :expiration_month, :expiration_year, :firstname, :lastname, presence: true
end
