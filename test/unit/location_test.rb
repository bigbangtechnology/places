require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  should validate_presence_of(:address)
  
  should belong_to(:place)
  
  context "when saving a location" do
    setup do
      @location = Factory(:location)
    end
    
    should "save the latitude and longitude" do
      assert_equal 123.456, @location.lat
      assert_equal 123.456, @location.lng
    end
  end
end