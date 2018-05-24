class Admin::ArtistsEventsController < Admin::BaseController

  def new
    @artist = Artist.find(params[:artist_id])
    @events = Event.all
    @artists_event = ArtistsEvent.new
  end

  def create
    artist = Artist.find(params[:artist_id])
    event = Event.find(params[:event_id])
    artists_events = ArtistsEvent.new({artist: artist, event: event})
    if artists_events.save
      redirect_to event_path(event.id)
    else
      render :new
    end
  end

  def show
    @artist_events = ArtistEvent.all
  end

  def destroy
    event = Event.find(params[:id])
    artists_event = ArtistsEvent.find(params[:id])
    artists_event.destroy
    redirect_to event_path(event)
  end

  private

  def artist_event_params
    require(:artists_events).permit(:artist_id, :event_id)
  end
end
