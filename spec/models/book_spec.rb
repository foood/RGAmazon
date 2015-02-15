require 'rails_helper'

RSpec.describe Book, :type => :model do

  it { should belong_to :category }
  it { should belong_to :author }
  it { should have_many :ratings }
  it { should have_many :order_items }

  it { should validate_presence_of(:title).with_message('Title cannot be blank')}
  it { should validate_presence_of(:price).with_message('Price cannot be blank')}
  it { should validate_presence_of(:stock).with_message('Stock cannot be blank')}

  it "is valid without an author" do
    expect(build :book, author: nil).to be_valid
  end

  it "is valid without an category" do
    expect(build :book, category: nil).to be_valid
  end
  it "is valid without an category" do
    book = create :book, category_id: nil
    expect(book.category).to eq(1)
  end

end
