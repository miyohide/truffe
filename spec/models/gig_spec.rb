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
#

require 'spec_helper'

describe Gig do

end