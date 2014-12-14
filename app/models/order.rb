class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :creditcard
  after_initialize :init

  def init

    self.state  ||= "in progress"
  end
end
