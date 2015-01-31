class User < ActiveRecord::Base
  belongs_to :role
  has_many :orders
  has_many :ratings
  has_many :credit_cards

  before_create :set_default_role

  validates :first_name, presence: {:message => 'First name cannot be blank'}
  validates :last_name,  presence: {:message => 'Last name cannot be blank'}
  validates :password,   presence: {:message => 'Password cannot be blank'}
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

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name        = auth["info"]["first_name"] unless auth["info"].blank?
      user.last_name         = auth["info"]["last_name"] unless auth["info"].blank?
    end
  end

  def admin?
    self.role.try(:name) == "admin"
    self.id == 1
  end

end
