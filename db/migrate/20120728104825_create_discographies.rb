class CreateDiscographies < ActiveRecord::Migration
  def change
    create_table :discographies do |t|
      t.date :release_date
      t.string :title
      t.string :artist
      t.text :players
      t.string :record_co
      t.string :url
      t.text :comment
      t.timestamps
    end
  end
end
