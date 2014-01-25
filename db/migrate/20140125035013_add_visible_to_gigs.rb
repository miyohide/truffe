class AddVisibleToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :visible, :boolean, :default => false
  end
end
