class User < ApplicationRecord

  has_many :secrets
  has_many :locations, through: :secrets

  #has_secure_token :auth_token
  has_secure_password

  validates :email, :name, presence: true
  validates :email, :name, uniqueness: true


  def self.find_or_create_from_auth_hash(auth_hash)
    @user = User.where(:uid => auth_hash['uid']).first_or_create do |user|
      user.uid = auth_hash['uid']
      user.provider = auth_hash['provider']
      user.email = auth_hash['info']['email']
      user.name = auth_hash['info']['first_name']
      user.password = SecureRandom.hex(10)
    end
  end

  def close_secrets
    self.secrets.collect { |secret| secret.close_secrets }
  end

  def can_access_user_secrets?(params)
    if params == self.id
    end
  end

end
