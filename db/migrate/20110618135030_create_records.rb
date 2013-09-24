class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.integer :ticket_id
      t.integer :user_id
      t.boolean :gehoert
      t.text    :link

      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
