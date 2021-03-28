class MarinasController < ApplicationController
  def index
    @marinas = Marina.order("created_at DESC")
  end

  def show
    @marina = Marina.find(params[:id])
  end

  def show_vessels
    @marina = Marina.find(params[:id])
    @vessels = @marina.vessels
    render template: 'vessels/index'
  end
end
