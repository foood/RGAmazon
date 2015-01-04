require 'rails_helper'

RSpec.describe Customer, :type => :model do
  let(:customer) {FactoryGirl.create :customer}

  it "is invalid without an firstname" do
    expect(FactoryGirl.build :customer, firstname: nil).not_to be_valid
  end

  it "is invalid without an lastname" do
    expect(FactoryGirl.build :customer, lastname: nil).not_to be_valid
  end

  it "is invalid without an password" do
    expect(FactoryGirl.build :customer, password: nil).not_to be_valid
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build :customer, email: nil).not_to be_valid
  end

  it "does not allow duplicate email" do
    expect(FactoryGirl.build :customer, email: customer.email).not_to be_valid
  end
end
