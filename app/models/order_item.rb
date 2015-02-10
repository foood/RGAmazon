class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order


  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }



  def self.best_books
    group(:book_id).sum(:quantity).sort_by {|book_id, quantity| quantity}.last(5).to_h.keys

  end

  def price
      book.price

  end

  def total_price
    price * quantity
  end


end
