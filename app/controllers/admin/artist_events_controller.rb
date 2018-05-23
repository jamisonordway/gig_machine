class Admin::ArtistEventsController < Admin::BaseController

  def new
    @artist = Artist.find(params[:artist_id])
    @events = Event.all
    @artist_event = ArtistEvent.new
  end
end
