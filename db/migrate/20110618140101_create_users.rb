class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :ani
      t.integer :pw
      t.string :vorname
      t.string :nachname
      t.string :geschlecht
      t.string :rolle

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
