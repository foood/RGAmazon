require 'rails_helper'

RSpec.describe Rating, :type => :model do

  it "is invalid biggest ten" do
    expect(FactoryGirl.build :rating, rating: Random.rand(11..1000)).not_to be_valid
  end

  it "is invalid if zero" do
    expect(FactoryGirl.build :rating, rating: 0).not_to be_valid
  end

  it "is invalid if not number" do
    expect(FactoryGirl.build :rating, rating: "string").not_to be_valid
  end

end
