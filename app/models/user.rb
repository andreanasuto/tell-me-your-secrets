class User < ApplicationRecord
  #has_secure_token :auth_token
  #has_secure_password
  has_many :secrets
  has_many :locations, through: :secrets
end
