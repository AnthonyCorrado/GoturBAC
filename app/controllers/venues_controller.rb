class VenuesController < ApplicationController

  def index
    @venues = Venue.party(params[:venue])
  end

  def show
  end
end
