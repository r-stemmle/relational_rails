class MarinasController < ApplicationController
  def index
    @marinas = Marina.order("created_at DESC")
  end

  def show
    @marina = Marina.find(params[:id])
  end

  def new
  end

  def create
    info = params[:marina]
    marina = Marina.new({
      name: info[:name],
      city: info[:city],
      state: info[:state],
      has_boat_ramp: info[:has_boat_ramp],
      low_tide_depth: info[:low_tide_depth],
      high_tide_depth: info[:high_tide_depth]
      })
    marina.save
    redirect_to '/marinas'
  end

  def edit
    @marina = Marina.find(params[:id])
  end

  def update
    marina = Marina.find(params[:id])
    info = params[:marina]
    marina.update({
      name: info[:name],
      city: info[:city],
      state: info[:state],
      has_boat_ramp: info[:has_boat_ramp],
      low_tide_depth: info[:low_tide_depth],
      high_tide_depth: info[:high_tide_depth]
      })
    marina.save
    redirect_to "/marinas/#{marina.id}"
  end

  def destroy
  end


  def show_vessels
    @marina = Marina.find(params[:id])
    @vessels = @marina.vessels
    render template: 'vessels/index'
  end
end
