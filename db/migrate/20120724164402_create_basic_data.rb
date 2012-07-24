class CreateBasicData < ActiveRecord::Migration
  def change
    create_table :basic_data do |t|
      create_table :basic_data do |t|
      t.string :site_name
      t.string :email
      t.text :message
      t.text :profile
      t.timestamps
    end
  end
end
