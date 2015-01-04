require 'rails_helper'

RSpec.describe Order, :type => :model do

  it "is invalid without an amount" do
    expect(FactoryGirl.build :order, amount: nil).not_to be_valid
  end

  it "is invalid without an completed_date" do
    expect(FactoryGirl.build :order, completed_date: nil).not_to be_valid
  end

  it "is invalid without an state" do
    expect(FactoryGirl.build :order, state: nil).not_to be_valid
  end

  it "belongs to customer" do
    expect(FactoryGirl.build :order).to respond_to :customer
  end

  it "belongs to credit_card" do
    expect(FactoryGirl.build :order).to respond_to :credit_card
  end

end
