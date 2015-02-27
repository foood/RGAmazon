class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit_card
  belongs_to :order_status
  has_many :order_items, dependent: :destroy
  belongs_to :billing_address,  :foreign_key => "billing_address_id"
  belongs_to :shipping_address, :foreign_key => "shipping_address_id"
  accepts_nested_attributes_for :billing_address, :allow_destroy => true
  accepts_nested_attributes_for :shipping_address, :allow_destroy => true

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