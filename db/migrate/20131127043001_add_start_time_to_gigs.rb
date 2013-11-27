class AddStartTimeToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :start_time, :time

  end
end
