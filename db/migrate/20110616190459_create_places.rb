class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name

      t.timestamps
    end
    
    add_index :places, :name
  end

  def self.down
    drop_table :places
  end
end
