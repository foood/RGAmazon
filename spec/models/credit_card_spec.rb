require 'rails_helper'

RSpec.describe CreditCard, :type => :model do

  it "is invalid without an ccv" do
    expect(FactoryGirl.build :credit_card, ccv: nil).not_to be_valid
  end

  it "is invalid without an expiration_month" do
    expect(FactoryGirl.build :credit_card, expiration_month: nil).not_to be_valid
  end

  it "is invalid without an expiration_year" do
    expect(FactoryGirl.build :credit_card, expiration_year: nil).not_to be_valid
  end

  it "is invalid without an firstname" do
    expect(FactoryGirl.build :credit_card, firstname: nil).not_to be_valid
  end

  it "is invalid without an lastname" do
    expect(FactoryGirl.build :credit_card, lastname: nil).not_to be_valid
  end

  it "belongs to customer" do
    expect(FactoryGirl.build :credit_card).to respond_to :customer
  end

end
