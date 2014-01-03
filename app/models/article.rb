class Article < ActiveRecord::Base
  default_scope :order => 'published_on desc'
  paginates_per 20
end
