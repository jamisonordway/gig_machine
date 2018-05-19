class Venue < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  validates_presence_of :location
  validates_presence_of :email
  has_many :events
end
