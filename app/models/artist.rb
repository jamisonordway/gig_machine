class Artist < ApplicationRecord
  has_many :users
  has_many :events, through: :artists_events
end
