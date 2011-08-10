require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  should validate_presence_of(:street)
  should validate_presence_of(:province)
  should validate_presence_of(:country)
  
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
  
  should "have a properly formatted full address" do
    location = Factory(:location)
    
    assert_equal "123 Fake St., Ontario, Canada", location.full_address
  end
end