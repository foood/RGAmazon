class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :role
  has_many :orders
  has_many :ratings
  has_many :credit_cards
  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy
  accepts_nested_attributes_for :shipping_address, :allow_destroy => true
  accepts_nested_attributes_for :billing_address,  :allow_destroy => true


  before_create :set_default_role, :set_addresses

  validates :first_name, presence: {:message => 'First name cannot be blank'}
  validates :last_name,  presence: {:message => 'Last name cannot be blank'}
  #validates :password,   presence: {:message => 'Password cannot be blank'}
  validates :email,      presence: {:message => 'Email cannot be blank'},
                       uniqueness: {:message => 'This email is already in use'}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :omniauthable, :omniauth_providers => [:facebook]

  def set_default_role
      self.role ||= Role.find_by_name('customer')
  end
  def full_name
    "#{first_name.first}. #{last_name}"
  end
  def set_addresses
    self.shipping_address = ShippingAddress.find_or_create_by(user_id: self.id)
    self.billing_address = BillingAddress.find_or_create_by(user_id: self.id)
  end


  def self.from_omniauth(auth)
    user = find_by(auth.slice(:provider, :uid)) || initialize_from_omniauth(auth)
    user.update_dynamic_attributes(auth)

    end

    def self.initialize_from_omniauth(auth)
      new do |user|
        user.provider          = auth[:provider]
        user.uid               = auth[:uid]
        user.email             = auth.info.email
        user.password          = Devise.friendly_token[0,20]
        user.first_name        = auth["info"]["first_name"] unless auth["info"].blank?
        user.last_name         = auth["info"]["last_name"] unless auth["info"].blank?
        user.remote_avatar_url = auth.info.image.gsub('http://','https://')

      end
    end

    def update_dynamic_attributes(auth)
      self.remote_avatar_url = auth.info.image.gsub('http://','https://')
      self.password          = Devise.friendly_token[0,20]

      save!
      self

    end

  def admin?
    self.role.try(:name) == "admin"
    self.id == 1
  end

end
