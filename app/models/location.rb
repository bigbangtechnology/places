class Location < ActiveRecord::Base
  
  # behaviours
  acts_as_mappable :default_units => :kms,
    :auto_geocode => {
      :field         => :address,
      :error_message => "Could not geocode address"
    }
  
  # validations
  validates_presence_of :address
  
  # associations
  belongs_to :place

end
