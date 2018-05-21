class VenuesController < ApplicationController


  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    Venue.create(venue_params)
    redirect_to venues_path
  end

  private

  def venue_params
    params.requre(:venue).permit(:name, :location, :email)
  end
end
