require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  should belong_to(:place)
end
