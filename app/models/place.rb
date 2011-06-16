class Place < ActiveRecord::Base
  has_many :considerations
  has_many :interests, :through => :considerations
end
