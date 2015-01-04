require 'rails_helper'

RSpec.describe Author, :type => :model do
  let(:author) {FactoryGirl.create :author}

  it "is invalid without an firstname" do
    expect(FactoryGirl.build :author, firstname: nil).not_to be_valid
  end

  it "is invalid without an lastname" do
    expect(FactoryGirl.build :author, lastname: nil).not_to be_valid
  end
end
