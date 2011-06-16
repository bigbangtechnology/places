class InterestsController < ApplicationController
  def index
    @interests = Interest.all
  end
  
  def show
    @interest = Interest.includes(:places).find(params[:id])
  end
end