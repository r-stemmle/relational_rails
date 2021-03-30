class VesselsController < ApplicationController
  def index
    @vessels = Vessel.all
  end

  def new
    @marina = Marina.find(params[:id])
  end

  def create
    @marina = Marina.find(params[:id])
    vessel = @marina.vessels.create(
      name:           params[:name],
      make:           params[:make],
      length_overall: params[:length_overall],
      mast_up:        params[:mast_up]
    )
    vessel.save
    redirect_to marinas_vessels_path(@marina.id)
  end

  def show
    @vessel = Vessel.find(params[:id])
  end
end
