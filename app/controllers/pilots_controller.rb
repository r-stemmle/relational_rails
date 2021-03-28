class PilotsController < ApplicationController
  def index
    @pilots = Pilot.all
  end

  def show
    @pilot = Pilot.find(params[:id])
  end
end