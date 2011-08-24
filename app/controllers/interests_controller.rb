class InterestsController < ApplicationController
  def index
    @interests = Interest.all
  end
  
  def show
    location = params[:location] || current_location
    
    @interest = Interest.find(params[:id])

    @locations = Location.joins(:place => [:interests]).where(["interests.id = ?", @interest.id]).all
    @locations.sort_by_distance_from(location.to_s)
  end
end