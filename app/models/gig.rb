# == Schema Information
#
# Table name: gigs
#
#  id           :integer          not null, primary key
#  gig_date     :date             not null
#  gig_date_end :date
#  gig_title    :string(255)
#  group        :string(255)
#  location     :string(255)
#  charge       :integer
#  players      :string(255)
#  comment      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recommend    :integer          default(0)
#  start_time   :time
#  visible      :boolean          default(FALSE)
#

class Gig < ActiveRecord::Base
  attr_accessible :gig_date, :gig_date_end, :gig_title, :group, :location, :charge, :players, :comment, :recommend, :start_time, :visible

  validates :gig_date, :presence => true
  validates :charge, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }, unless: "charge.nil?"

  default_scope :order => 'gig_date ASC'
  paginates_per 50
end
