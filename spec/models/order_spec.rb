require 'rails_helper'

RSpec.describe Order, :type => :model do

  it { should belong_to :user }
  it { should belong_to :credit_card }
  it { should have_many :order_items }

  it { should validate_presence_of :order_status }

end
