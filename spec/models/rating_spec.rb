require 'rails_helper'

RSpec.describe Rating, :type => :model do

  it { should belong_to :book }
  it { should belong_to :user }

  it { should validate_numericality_of(:rating).with_message('only number from one to ten') }
end
