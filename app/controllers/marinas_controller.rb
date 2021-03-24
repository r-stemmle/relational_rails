class MarinasController < ApplicationController
  def index
    @marinas = Marina.all 
  end
end
