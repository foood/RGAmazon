require 'rails_helper'

RSpec.describe Author, :type => :model do
  let(:author) {FactoryGirl.create :author}

  it "is invalid without an first_name" do
    expect(FactoryGirl.build :author, first_name: nil).not_to be_valid
  end

  it "is invalid without an last_name" do
    expect(FactoryGirl.build :author, last_name: nil).not_to be_valid
  end
end
