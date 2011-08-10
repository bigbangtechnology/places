class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :place_id, :null => false
      t.string  :address,  :null => false
      t.float   :lat,      :default => 0
      t.float   :lng,      :default => 0
    end
    
    add_index :locations, [:lat, :lng]
    add_index :locations, :lat
    add_index :locations, :lng
    add_index :locations, :place_id
    add_index :locations, :address
  end

  def self.down
    drop_table :locations
  end
end