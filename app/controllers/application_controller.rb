class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_location
    return @current_location if defined? @current_location
    @current_location = session[:geolocation] unless session[:geolocation].nil?
  end
  
  def determine_location
    if current_location.is_a? Geolocation
      # TODO: Geokit 1.6.0 will check for method to_lat_lng
      @location = current_location.to_lat_lng
      return
    end
    
    @location = params[:location] || "642 King St. West Unit 401, Toronto, Ontario, Canada"
  end
  
end
