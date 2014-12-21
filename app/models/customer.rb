class Customer < ActiveRecord::Base
  validates :firstname, :presence   => {:message => 'Firstname cannot be blank'}
  validates :password,  :presence   => {:message => 'Password cannot be blank'}
  validates :lastname,  :presence   => {:message => 'Lastname cannot be blank'}
  validates :email,     :uniqueness => {:message => 'This email is already in use'}

  has_many :orders
  has_many :ratings
  has_many :credit_cards

end
