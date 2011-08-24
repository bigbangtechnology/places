require 'test_helper'

class ConsiderationTest < ActiveSupport::TestCase
  should belong_to(:interest)
  should belong_to(:place)
end
