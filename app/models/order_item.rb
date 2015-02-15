class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order


  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }


  def price
      book.price

  end

  def total_price
    price * quantity
  end


end
