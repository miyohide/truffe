# == Schema Information
#
# Table name: discographies
#
#  id           :integer          not null, primary key
#  release_date :date
#  title        :string(255)
#  artist       :string(255)
#  players      :text
#  record_co    :string(255)
#  url          :string(255)
#  comment      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Discography < ActiveRecord::Base
  attr_accessible :release_date, :title, :artist, :players, :record_co, :url, :comment

  validates :title,  :presence => true
  validates :artist, :presence => true
end
