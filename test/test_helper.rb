ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  setup :stub_geocoder

  def stub_geolocation_params
    # hash based on HTML5 Geolocation API position object
    {
      "timestamp" => "1314207823328",
      "coords" => {
        "latitude"  => "43.6443438",
        "longitude" => "-79.4016513",
        "accuracy"  => "42",
        "altitude"  => "null",
        "heading"   => "null",
        "speed"     => "null",
        "altitudeAccuracy" => "null"
      }
    }
  end
  
  def stub_geocoder
    geocode_payload = GeoKit::GeoLoc.new(:lat => 123.456, :lng => 123.456)  
    geocode_payload.success = true  
    
    GeoKit::Geocoders::MultiGeocoder.stubs(:geocode).returns(geocode_payload)
  end
end