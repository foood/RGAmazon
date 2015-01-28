class Address < ActiveRecord::Base
  belongs_to :country

  validates :address, :zip_code, :city, :phone, :country, presence: true
end
