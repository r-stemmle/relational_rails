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
    marina.update(
      name:            params[:marina][:name],
      city:            params[:marina][:city],
      state:           params[:marina][:state],
      has_boat_ramp:   params[:marina][:has_boat_ramp],
      low_tide_depth:  params[:marina][:low_tide_depth],
      high_tide_depth: params[:marina][:high_tide_depth]
      )
      marina.save
      redirect_to "/marinas/#{marina.id}"
  end

  def destroy
    Marina.find(params[:id]).destroy
    redirect_to '/marinas'
  end


  def vessels
    @marina = Marina.find(params[:id])
    @vessels = @marina.vessels
    render template: 'vessels/index'
  end

  def sorted_vessels
    @marina = Marina.find(params[:id])
    @vessels = @marina.vessels.sorted
    render template: 'vessels/index'
  end
end
