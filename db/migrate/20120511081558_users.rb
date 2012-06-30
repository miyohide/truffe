class Users < ActiveRecord::Migration
  def up
		create_table :users do |t|
			t.string :email, :null => false
			t.string :hashed_password, :null => false
			t.string :name
			t.date :birthday
			t.boolean :administrator, :default => 0
			t.timestamps
		end
  end

  def down
		drop_table :users
  end
end
