require File.dirname(__FILE__) + '/../test_helper'

class GeolocationsControllerTest < ActionController::TestCase     

  context "when creating geolocation data" do
    setup do
      post :create, :params => stub_geolocation_params
    end
    
    should respond_with :ok
    
    should "assign the geolocation session" do
      assert @request.session[:geolocation]
      assert @request.session[:geolocation].kind_of?(Geolocation)
    end
  end

end