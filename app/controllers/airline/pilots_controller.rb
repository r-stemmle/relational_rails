require '/Users/jaharaclark/turing/back_end/mod_2/projects/relational_rails/app/models/pilot.rb'

require "/Users/jaharaclark/turing/back_end/mod_2/projects/relational_rails/app/models/airline.rb"

class Airline::PilotsController < ApplicationController
  def index
    @airline = Airline.find(params[:airline_id])
  end

  def edit
    @airline = Airline.find(params[:airline_id])
    @pilot = Pilot.find(params[:id])
   end

    def update
    # @airline = Airline.find(params[:airline_id])
    @pilot = Pilot.find(params[:id])
    @pilot.update(name: params[:name], is_captain: params[:is_captain], years_experience: params[:years_experience], id: params[:id])
    redirect_to "/airlines/#{@airline.id}/pilots"
   end

   
end 