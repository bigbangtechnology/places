class Consideration < ActiveRecord::Base
  belongs_to :place
  belongs_to :interest, :counter_cache => true
end
