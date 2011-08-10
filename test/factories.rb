Factory.define :consideration do |m|
end

Factory.define :interest do |m|
end

Factory.define :location do |m|
  m.street    "123 Fake St."
  m.province  "Ontario"
  m.country   "Canada"
  
  m.association :place
end

Factory.define :place do |m|
end