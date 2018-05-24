class ArtistsEvent < ApplicationRecord
  belongs_to :event
  belongs_to :artist

  def event_artists

  end
end
