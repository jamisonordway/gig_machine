class User < ApplicationRecord
  enum role: [:artist, :admin]
  
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
