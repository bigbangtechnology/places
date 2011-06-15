class CreateInterests < ActiveRecord::Migration
  def self.up
    create_table :interests do |t|
      t.string :name, :default => nil

      t.timestamps
    end

    add_index :interests, :name
  end

  def self.down
    drop_table :interests
  end
end