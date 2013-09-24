class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :ticketNumber
      t.integer :user_id
      t.integer :geschlossenVon
      t.string  :subject
      t.text    :inhalt
      t.string  :bereich
      t.string  :status
      t.string  :prio
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
