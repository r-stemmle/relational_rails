class Airline::PilotsController < ApplicationController
  def index
    @airline = Airline.find(params[:airline_id])
  end
end 