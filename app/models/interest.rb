class Interest < ActiveRecord::Base
  has_many :considerations
  has_many :places, :through => :considerations
end
