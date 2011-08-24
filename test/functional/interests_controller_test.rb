require 'test_helper'

class InterestsControllerTest < ActionController::TestCase

  context "accessing the interests index view" do
    setup do
      get :index
    end
    
    should respond_with :success
  end
  
  context "accessing a specific interests view" do
    setup do
      interest = Factory(:interest)
      
      get :show, :id => interest.id
    end
    
    should respond_with :success
  end
  
  context "when requesting with a location string" do
    setup do
      get :index
    end
    
    should respond_with :success
    should assign_to(:determined_location).with_kind_of(String)
  end
  
  context "when requesting with a location session already set" do
    setup do
      session[:geolocation] = Geolocation.new(stub_geolocation_params)
      
      get :index
    end
    
    should respond_with :success
    
    # TODO: Geokit 1.6.0 will check for method to_lat_lng, so kind can be Geolocation
    should assign_to(:determined_location).with_kind_of(String)
  end
  
  context "when requesting without a location" do
    setup do
      get :index
    end
    
    should respond_with :success
    should assign_to(:determined_location).with_kind_of(String)
  end

end
