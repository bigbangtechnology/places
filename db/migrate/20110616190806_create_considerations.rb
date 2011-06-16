class CreateConsiderations < ActiveRecord::Migration
  def self.up
    create_table :considerations do |t|
      t.integer :place_id, :null => false
      t.integer :interest_id, :null => false

      t.timestamps
    end
    
    add_index :considerations, [:place_id, :interest_id]
    add_index :considerations, :place_id
    add_index :considerations, :interest_id
  end

  def self.down
    drop_table :considerations
  end
end
