Factory.define :consideration do |m|
end

Factory.define :interest do |m|
end

Factory.define :location do |m|
  m.address   "123 Fake St., Toronto, Ontario, Canada"
  
  m.association :place
end

Factory.define :place do |m|
end