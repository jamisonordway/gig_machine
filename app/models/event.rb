class Event < ApplicationRecord
  validates :title, :presence => true
  validates :description, :presence => true
  validates :date, :presence => true

  belongs_to :venue
  has_many :artists_events
  has_many :artists, through: :artists_events
end
