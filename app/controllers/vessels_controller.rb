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

  def update
    vessel = Vessel.find(params[:id])
    vessel.update(
    name:           params[:vessel][:name],
    make:           params[:vessel][:make],
    length_overall: params[:vessel][:length_overall],
    mast_up:        params[:vessel][:mast_up]
    )
    vessel.save
    redirect_to vessel_id_path
  end

  def edit
    @vessel = Vessel.find(params[:id])
  end

  def show
    @vessel = Vessel.find(params[:id])
  end
end
