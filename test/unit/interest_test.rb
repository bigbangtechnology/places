require 'test_helper'

class InterestTest < ActiveSupport::TestCase
  should have_many(:considerations)
  should have_many(:places).through(:considerations)
end
