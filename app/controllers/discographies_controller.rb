class DiscographiesController < ApplicationController
  def index
    @page_title = t('discographies.title')
    @discographies = Discographies.order('release_date desc').limit(100)
  end
end
