class CreateBlogEntries < ActiveRecord::Migration
  def change
    create_table :blog_entries do |t|
      t.integer :user_id
      t.date :blog_date
      t.string :heading
      t.text :body
      t.string :note
      t.timestamps
    end
  end
end
