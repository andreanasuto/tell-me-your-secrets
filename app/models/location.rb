class Location < ApplicationRecord
  has_many :secrets
  has_many :users, through: :secrets
end
