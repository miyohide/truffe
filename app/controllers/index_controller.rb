class IndexController < ApplicationController
  USERS = { "solo" => "monk" }

  before_filter :authenticate

  def index
    @discographies = Discographies.find(:all, :limit => 1, :order => 'release_date asc')
  end

  def profile
    @basic_data = BasicData.where('id = 1').first
  end

  def photos
    @photos = Kaminari.paginate_array(Photos.find(:all, :limit => 100, :order => 'photo_date asc')).page(params[:page])
  end

  def contacts
  end

  private
  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
