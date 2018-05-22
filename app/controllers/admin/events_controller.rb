class Admin::EventsController < Admin::BaseController
  def new
    @venue = Venue.find(params[:venue_id])
    @event = @venue.events.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @event = @venue.events.create(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def edit
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:venue_id])
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
