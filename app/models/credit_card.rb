class CreditCard < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  validates :ccv, :expiration_month, :expiration_year, :first_name, :last_name, presence: true
end
