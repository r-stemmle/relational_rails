class AirlinesController < ApplicationController
  def index
    @airlines = Airline.all
  end

  def show
    @airline = Airline.find(params[:id])
   end

   def show_pilots
    @pilots = Pilot.where(:airline_id => params[:id])
   end
end
