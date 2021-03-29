class VesselsController < ApplicationController
  def index
    @vessels = Vessel.all
  end

  def new
  end

  def create
    binding.pry 
  end

  def show
    @vessel = Vessel.find(params[:id])
  end
end
