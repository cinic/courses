class Invitation
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, :type => String
  field :token, :type => String
  
  validates_presence_of :email
  validates :email, uniqueness: true
  #validate :recipient_is_not_registered
  
  before_create :generate_token
  
private
  
  def recipient_is_not_registered
    errors.add :email, 'is already in list' if Invitation.where({email: email})
  end
  
  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end