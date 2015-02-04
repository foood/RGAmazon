class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit_card
  belongs_to :order_status
  belongs_to :billing_address, :class_name => "Address"
  belongs_to :shipping_address, :class_name => "Address"
  has_many :order_items, dependent: :destroy

  before_validation :update_subtotal, :set_order_status

  before_save :update_subtotal, :set_completed_date


  validates :amount, :order_status, presence: true

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

  def set_completed_date
    if self.order_status == OrderStatus.find_by( name:['Delivered', 'Cancelled'] )
      self.completed_date = Time.now
    else
      self.completed_date = nil
    end
  end
end