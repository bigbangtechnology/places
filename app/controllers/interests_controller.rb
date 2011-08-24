class InterestsController < ApplicationController
  
  before_filter :determine_location
  
  def index
    @interests = Interest.all
  end
  
  def show
    @interest = Interest.find(params[:id])

    @locations = Location.joins(:place => [:interests]).where(["interests.id = ?", @interest.id]).all
    @locations.sort_by_distance_from(@determined_location)
  end
end