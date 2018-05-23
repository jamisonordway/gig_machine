class Admin::ArtistsEventsController < Admin::BaseController

  def new
    @artist = Artist.find(params[:artist_id])
    @events = Event.all
    @artists_event = ArtistsEvent.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @event = Event.find(params[:event_id])
    if @artist.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @artist_events = ArtistEvent.all
  end
end
