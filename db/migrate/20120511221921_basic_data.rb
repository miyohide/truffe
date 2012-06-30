class BasicData < ActiveRecord::Migration
  def up
		create_table :basic_data do |t|
		t.string :site_name
		t.string :email
		t.text :message
		t.text :profile
		t.timestamps
		end
  end

  def down
		drop_table :basic_data
  end
end
