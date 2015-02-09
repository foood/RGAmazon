class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order


  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }


  def best_order_items

  end

  def sum_quantity
    OrderItem.group(:book_id).sum(:quantity)

  end

  def price
      book.price

  end

  def total_price
    price * quantity
  end


end
