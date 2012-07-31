class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_name, :null => false
      t.string :hashed_password, :null => false
      t.string :name
      t.string :email
      t.date :birthday
      t.boolean :administrator, :default => false
      t.timestamps
    end
  end
end
