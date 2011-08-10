class Location < ActiveRecord::Base
  include Geokit::Geocoders
  
  # behaviours
  acts_as_mappable :default_units => :kms
  
  # validations
  validates_presence_of :street, :province, :country
  
  # associations
  belongs_to :place
  
  # callbacks
  before_save :geocode_address
  
  # instance methods
  def full_address
    "#{self.street}, #{self.province}, #{self.country}"
  end
  
  private
  
  def geocode_address
    geocode = MultiGeocoder.geocode(self.full_address)
    
    logger.info(geocode.inspect)
    
    return false if !geocode.success
    
    self.lat = geocode.lat
    self.lng = geocode.lng
  end
end
