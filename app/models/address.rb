class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :user
  accepts_nested_attributes_for :country,  :allow_destroy => true

  TYPES = %w( BillingAddress ShippingAddress )
  before_save :set_address_type
  validates :type, presence: true, :inclusion => { :in => TYPES }

  #validates :address, :zip_code, :city, :phone, :country, presence: true

  def set_address_type

  end
end



