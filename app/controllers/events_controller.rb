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
  end 

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :venue_id)
  end
end
