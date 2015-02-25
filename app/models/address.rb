class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  #validates :address, :zip_code, :city, :phone, :country, presence: true
end



