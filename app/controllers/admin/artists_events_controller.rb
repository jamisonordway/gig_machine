class Admin::ArtistsEventsController < Admin::BaseController

  def new
    @artist = Artist.find(params[:artist_id])
    @event = Event.find(params[:event_id])
  end
end
