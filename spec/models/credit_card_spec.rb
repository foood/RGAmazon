require 'rails_helper'

RSpec.describe CreditCard, :type => :model do

  it { should belong_to :user }
  it { should have_many :orders }

  it { should validate_presence_of :ccv }
  it { should validate_presence_of :expiration_month }
  it { should validate_presence_of :expiration_year }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

end
