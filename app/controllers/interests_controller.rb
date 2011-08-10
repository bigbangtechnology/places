class InterestsController < ApplicationController
  def index
    @interests = Interest.all
  end
  
  def show
    # TODO: Make this dynamic for the current session
    # 642 King St. West Unit 401, Toronto, Ontario, Canada
    current_location = params[:location] || "642 King St. West Unit 401, Toronto, Ontario, Canada"
    
    @interest = Interest.find(params[:id])

    @locations = Location.joins(:place => [:interests]).where(["interests.id = ?", @interest.id]).all
    @locations.sort_by_distance_from(current_location)
  end
end