class Gigs < ActiveRecord::Base
  default_scope :order => 'gig_date ASC'
  paginates_per 30 
end
