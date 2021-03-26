class PilotsController < ApplicationController
  def index
    @pilots = Pilot.all
  end

  def show
    @pilots_obj = Pilot.find(params[:id])
  end
end