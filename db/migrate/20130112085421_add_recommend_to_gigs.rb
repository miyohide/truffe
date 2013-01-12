class AddRecommendToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :recommend, :integer, :default => 0

  end
end
