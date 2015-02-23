class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :user
  has_many :orders

  validates :address, :zip_code, :city, :phone, :country, presence: true
end

class BillingAddress < Address


end

class ShippingAddress < Address


end