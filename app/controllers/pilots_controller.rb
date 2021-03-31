class PilotsController < ApplicationController
  def index
    @pilots = Pilot.all
  end

  def show
    @pilot = Pilot.find(params[:id])
  end

  def edit
    @pilot = Pilot.find(params[:id])
  end

  def update
    @pilot = Pilot.find(params[:id])
    @pilot.update(name: params[:name], is_captain: params[:is_captain], years_experience: params[:years_experience], id: params[:id])
    redirect_to "/pilots"
  end
end


 