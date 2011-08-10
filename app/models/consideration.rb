class Consideration < ActiveRecord::Base
  belongs_to :interest, :counter_cache => true
  belongs_to :place
end
