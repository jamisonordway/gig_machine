class Venue < ApplicationRecord
  validates :name, :presence => true
  validates :location, :presence => true
  validates :email, :presence => true
  has_many :events
end
