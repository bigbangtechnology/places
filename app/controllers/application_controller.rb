class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def current_location
    return @current_location if defined? @current_location
    @current_location = session[:geolocation] || "642 King St. West Unit 401, Toronto, Ontario, Canada"
  end
  
end
