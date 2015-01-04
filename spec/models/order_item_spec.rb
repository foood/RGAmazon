require 'rails_helper'

RSpec.describe OrderItem, :type => :model do

  it "is invalid without an price" do
    expect(FactoryGirl.build :order_item, price: nil).not_to be_valid
  end

  it "is invalid without an quantity" do
    expect(FactoryGirl.build :order_item, quantity: nil).not_to be_valid
  end

end
