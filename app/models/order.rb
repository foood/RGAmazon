class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit_card
  has_many :order_items

  after_initialize :init

  validates :amount, :completed_date, :state, presence: true

  def init
    self.state  ||= "in progress"
  end

end