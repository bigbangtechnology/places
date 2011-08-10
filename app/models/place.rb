class Place < ActiveRecord::Base
  has_many :considerations
  has_many :interests, :through => :considerations
  has_many :locations
end
