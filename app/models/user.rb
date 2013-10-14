class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  field :name, :type => String
  field :role, :type => String, :default => "learner"
  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
  attr_accessible :name, :password, :email, :role, :twitter_name, :provider, :url, :remember_me

  ## Socials accounts names
  field :twitter_name, :type => String
  field :provider, :type => String
  field :url, :type => String

  ROLES = %w[manager admin learner]
  #def role?(base_role)
  #  ROLES.index(base_role.to_s) <= ROLES.index(role)
  #end

  def self.find_for_facebook_oauth access_token
    if user = User.where(:url => access_token.info.urls.Facebook).first || User.where(:email => access_token.extra.raw_info.email).first
      user
    else 
      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Facebook, :name => access_token.extra.raw_info.name, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20]) 
    end
  end

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else 
      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :name => access_token.info.name, :email => access_token.extra.raw_info.domain+'@vk.com', :password => Devise.friendly_token[0,20]) 
    end
  end

end
