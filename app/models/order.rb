class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :creditcard
  after_initialize :init

  validates :amount, :completed_date, :state, presence: true

  def init
    self.state  ||= "in progress"
  end
end
