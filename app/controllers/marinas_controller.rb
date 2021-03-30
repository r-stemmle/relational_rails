class MarinasController < ApplicationController
  def index
    @marinas = Marina.descending_order_by_created
  end

  def show
    @marina = Marina.find(params[:id])
  end

  def new
    # @marina = Marina.find(params[:id])
  end

  def create
    marina = Marina.new(
      name:            params[:name],
      city:            params[:city],
      state:           params[:state],
      has_boat_ramp:   params[:has_boat_ramp],
      low_tide_depth:  params[:low_tide_depth],
      high_tide_depth: params[:high_tide_depth]
      )
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


  def vessels
    @marina = Marina.find(params[:id])
    @vessels = @marina.vessels
    render template: 'vessels/index'
  end
end
