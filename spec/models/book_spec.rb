require 'rails_helper'

RSpec.describe Book, :type => :model do

  let(:book) {FactoryGirl.create :book}

  it "is invalid without an title" do
    expect(FactoryGirl.build :book, title: nil).not_to be_valid
  end

  it "is invalid without an price" do
    expect(FactoryGirl.build :book, price: nil).not_to be_valid
  end

  it "is invalid without an stock" do
    expect(FactoryGirl.build :book, stock: nil).not_to be_valid
  end

  it "belongs to author" do
    expect(FactoryGirl.build :book).to respond_to :author
  end

  it "belongs to category" do
    expect(FactoryGirl.build :book).to respond_to :category
  end
  it { should have_many(:order_items) }
  it { should have_many(:ratings).through (:customer) }

end
