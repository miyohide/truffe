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

class Article < ActiveRecord::Base
  default_scope :order => 'published_on desc'
  paginates_per 20
end
