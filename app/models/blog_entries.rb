# == Schema Information
#
# Table name: blog_entries
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  blog_date  :date
#  heading    :string(255)
#  body       :text
#  note       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlogEntries < ActiveRecord::Base
end
