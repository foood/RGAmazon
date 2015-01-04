class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card

  after_initialize :init

  validates :amount, :completed_date, :state, presence: true

  def init
    self.state  ||= "in progress"
  end

end