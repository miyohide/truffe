class Links < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link_name
      t.string :url
      t.integer :kind_no
      t.timestamps
    end
  end
end
