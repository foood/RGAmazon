require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:role) {FactoryGirl.create :role}

  it { should belong_to :role }
  it { should have_many :orders }
  it { should have_many :ratings }
  it { should have_many :credit_cards }

  it { should validate_presence_of(:first_name).with_message('First name cannot be blank') }
  it { should validate_presence_of(:last_name).with_message('Last name cannot be blank') }
  it { should validate_presence_of :password }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }


end
