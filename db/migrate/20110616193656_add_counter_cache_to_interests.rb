class AddCounterCacheToInterests < ActiveRecord::Migration
  def self.up
    add_column :interests, :considerations_count, :integer, :default => 0
    
    add_index :interests, :considerations_count
  end

  def self.down
    remove_column :interests, :considerations_count
  end
end
