class CreateDiscographies < ActiveRecord::Migration
  def change
    create_table :discographies do |t|
      t.date :release_date
      t.string :album_name
      t.string :artist
      t.text :players
      t.string :record_co
      t.string :shop_url
      t.text :presentation
      t.timestamps
    end
  end
end
