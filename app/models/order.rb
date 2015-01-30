class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit_card
  belongs_to :order_status
  has_many :order_items

  before_create :set_order_status
  before_save :update_subtotal


  #validates :amount, :completed_date, :state, presence: true

  def subtotal
    order_items.collect { |items| items.valid? ? (items.quantity * items.price) : 0 }.sum
  end

  private
  def set_order_status
    self.order_status ||= OrderStatus.find_by_name('In Progress')

  end

  def update_subtotal
    self[:amount] = subtotal

  end
end