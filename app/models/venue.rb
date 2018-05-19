class Venue < ApplicationRecord
  has_many :events
  
  validates :name, :presence => true, :uniqueness => true
  validates :location, :presence => true
  validates :email, :presence => true
end
