# == Schema Information
#
# Table name: basic_data
#
#  id         :integer          not null, primary key
#  site_name  :string(255)
#  email      :string(255)
#  message    :text
#  profile    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BasicData < ActiveRecord::Base
end
