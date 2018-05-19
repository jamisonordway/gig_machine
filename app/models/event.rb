class Event < ApplicationRecord
    validates_presence_of :title
    validates_presence_of :description
    validates_presence_of :date
    validates_presence_of :venue_id
    belongs_to :venue
end
