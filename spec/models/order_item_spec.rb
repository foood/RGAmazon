require 'rails_helper'

RSpec.describe OrderItem, :type => :model do

  it { should belong_to :order }
  it { should belong_to :book }

  it { should validate_presence_of :quantity }


  it "calculate total price "do
    book = create :book, price: 12
    order_item = create :order_item, book_id: book.id, quantity:10

    expect(order_item.total_price).to eq(120)
  end
  it "calculate price "do
    book = create :book, price: 12
    order_item = create :order_item, book_id: book.id, quantity:10

    expect(order_item.total_price).to eq(120)
  end

end
