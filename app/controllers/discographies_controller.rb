class DiscographiesController < ApplicationController
  def index
    @discographies = Discographies.find(:all, :limit => 100, :order => 'release_date asc')
  end
end
