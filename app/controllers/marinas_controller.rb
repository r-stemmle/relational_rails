class MarinasController < ApplicationController
  def index
    @marinas = Marina.all
  end

  def show
    @marina = Marina.find(params[:id])
  end
end
