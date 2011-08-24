class GeolocationsController < ApplicationController
  
  def create
    session[:geolocation] = Geolocation.new(params)
    
    head :ok
  end
  
end