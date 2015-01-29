require 'rails_helper'

RSpec.describe Book, :type => :model do

  it { should belong_to :category }
  it { should belong_to :author }
  it { should have_many :ratings }
  it { should have_many :order_items }

  it { should validate_presence_of(:title).with_message('Title cannot be blank')}
  it { should validate_presence_of(:price).with_message('Price cannot be blank')}
  it { should validate_presence_of(:stock).with_message('Stock cannot be blank')}
end
