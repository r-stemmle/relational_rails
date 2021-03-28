class AirlinesController < ApplicationController
  def index
    @airlines = Airline.order(created_at: :desc)
  end

  def show
    @airline = Airline.find(params[:id])
   end
end
