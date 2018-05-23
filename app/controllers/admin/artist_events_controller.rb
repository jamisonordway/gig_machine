class Admin::ArtistEventsController < Admin::BaseController

  def new
    @artist = Artist.find(params[:artist_id])
    @events = Event.all
    @artist_event = ArtistEvent.new
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
end
