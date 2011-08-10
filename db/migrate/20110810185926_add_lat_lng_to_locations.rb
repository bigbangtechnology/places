class AddLatLngToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :lat, :float, :default => 0
    add_column :locations, :lng, :float, :default => 0
    
    add_index :locations, [:lat, :lng]
    add_index :locations, :lat
    add_index :locations, :lng
  end

  def self.down
    remove_column :locations, :lat
    remove_column :locations, :lng
  end
end