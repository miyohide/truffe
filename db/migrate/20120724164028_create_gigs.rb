class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.date :gig_date, :null => false
      t.date :gig_date_end
      t.string :gig_title
      t.string :group
      t.string :location
      t.integer :charge
      t.string :players
      t.string :comment
      t.timestamps
    end
  end
end

