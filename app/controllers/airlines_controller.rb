class AirlinesController < ApplicationController
  def index
    @airlines = Airline.all
  end

  def show
    @airline_obj = Airline.find(params[:id])
   end
end
