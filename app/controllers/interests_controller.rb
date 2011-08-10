class InterestsController < ApplicationController
  def index
    @interests = Interest.all
  end
  
  def show
    @distances = [1, 5, 10]
    
    #Location.within(5, :origin => )
    
    @interest = Interest.includes(:places).find(params[:id])
  end
end