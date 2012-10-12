class DiscographiesController < ApplicationController
  def index
    @page_title = t('discographies.title')
    @discographies = Discographies.find(:all, :limit => 100, :order => 'release_date asc')
  end
end
