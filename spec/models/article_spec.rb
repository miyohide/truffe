# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  heading      :string(255)
#  content      :text
#  published_on :date
#  tags         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Article do
end
