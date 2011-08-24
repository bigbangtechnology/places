require 'test_helper'

class GeolocationTest < ActiveSupport::TestCase
  
  context "when creating a new Geolocation" do
    setup do
      @geolocation = Geolocation.new(stub_geolocation_params)
    end
    
    should "have the latitude and longitude" do
      assert_equal stub_geolocation_params["coords"]["latitude"].to_f,  @geolocation.latitude
      assert_equal stub_geolocation_params["coords"]["longitude"].to_f, @geolocation.longitude
    end
  end
  
end
