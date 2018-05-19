class Event < ApplicationRecord
  validates :title, :presence => true
  validates :description, :presence => true
  validates :date, :presence => true

  belongs_to :venue
end
