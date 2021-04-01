class AirlinesController < ApplicationController
  def index
    @airlines = Airline.order(created_at: :desc)
  end

  def show
    @airline = Airline.find(params[:id])
   end

   def new
   end

   def create
    @created_airline = Airline.create(name: params[:name], fleet_size: params[:fleet_size], is_mainline_passenger: params[:is_mainline_passenger])
    redirect_to '/airlines'
   end

   def edit
    @airline = Airline.find(params[:id])
   end

   def update
    @airline = Airline.find(params[:id])
    @airline.update(name: params[:name], fleet_size: params[:fleet_size], is_mainline_passenger: params[:is_mainline_passenger])
    redirect_to "/airlines/#{@airline.id}"
   end
end
