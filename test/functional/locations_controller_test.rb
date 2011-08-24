require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  
  context "accessing a specific locations view" do
    setup do
      location = Factory(:location)
      
      get :show, :id => location.id
    end
    
    should respond_with :success
  end

end