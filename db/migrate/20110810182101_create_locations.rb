class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :place_id, :null => false
      t.string  :street,   :null => false
      t.string  :province, :null => false
      t.string  :country,  :null => false
    end
    
    add_index :locations, :place_id
    add_index :locations, :street
    add_index :locations, :province
    add_index :locations, :country
  end

  def self.down
    drop_table :locations
  end
end
