class EventsController < ApplicationController

  def index
    @events = Event.all
  end


  def new
    venue = Venue.find(params[:venue_id])
    @event = venue.events.new(event_params)
  end

  def create
    venue = Venue.find(params[:venue_id])
    venue.event.create(event_params)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to event_path(event)
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
