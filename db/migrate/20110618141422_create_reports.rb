class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer  :user_id
      t.time     :startZeit
      t.time     :endZeit
      t.integer  :abfrageAnzahl
      t.integer  :recordAnzahl
      
      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
