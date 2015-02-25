class BillingAddress < Address

  before_create :set_address_type

  def set_address_type
    self.address_type ='Billing'
  end
end