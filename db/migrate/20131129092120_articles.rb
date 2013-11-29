class Articles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :heading, :null => false
      t.text :content
      t.date :published_on, :null => false
      t.string :tags, array: true
      t.timestamps
    end
  end
end
