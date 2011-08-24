class LocationsController < ApplicationController
  
  def show
    @location = Location.includes(:place).find(params[:id])
  end
end