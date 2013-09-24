class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :vorname
      t.string :nachname
      t.string :geschlecht
      t.string :rolle
    end
    Product.create(:vorname => "Hans", :nachname => "Meier", :geschlecht => "m", :rolle => "user")
    Product.create(:vorname => "Susi", :nachname => "Lani", :geschlecht => "w", :rolle => "user")
  end

  def self.down
    drop_table :products
  end
end
