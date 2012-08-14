class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.date :photo_date
      t.string :file_no
      t.string :album_no
      t.string :title
      t.string :comment
      t.timestamps
    end
  end
end
