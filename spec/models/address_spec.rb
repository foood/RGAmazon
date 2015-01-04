require 'rails_helper'

RSpec.describe Address, :type => :model do

  let(:address) {FactoryGirl.create :address}

  it "is invalid without an address" do
    expect(FactoryGirl.build :address, address: nil).not_to be_valid
  end

  it "is invalid without an zipcode" do
    expect(FactoryGirl.build :address, zipcode: nil).not_to be_valid
  end

  it "is invalid without an city" do
    expect(FactoryGirl.build :address, city: nil).not_to be_valid
  end

  it "is invalid without an phone" do
    expect(FactoryGirl.build :address, phone: nil).not_to be_valid
  end

  it "is invalid without an country" do
    expect(FactoryGirl.build :address, country: nil).not_to be_valid
  end

  it "belongs to country" do
    expect(FactoryGirl.build :address).to respond_to :country
  end
end
