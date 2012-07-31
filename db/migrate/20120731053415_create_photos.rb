class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.date :photo_date
      t.string :title
      t.string :comment
      t.timestamps
    end
  end
end
