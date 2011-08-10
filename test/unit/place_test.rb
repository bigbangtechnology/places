require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  should have_many(:considerations)
  should have_many(:interests).through(:considerations)
  should have_many(:locations)
end
