class Customer < ActiveRecord::Base
  has_many :orders
  has_many :ratings
  has_many :credit_cards
end
