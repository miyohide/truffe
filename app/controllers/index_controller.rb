class IndexController < ApplicationController
  USERS = { "aaaa" => "bbbb" }

  before_filter :authenticate

    def index
      @discographies = Discographies.find(:all, :limit => 1, :order => 'release_date asc')
    end

    def profile
      @page_title = t('profile.title')
      # @basic_data = BasicData.find(1)でOK
      @basic_data = BasicData.where('id = 1').first
    end

    def photos
      @page_title = t('photos.title')
      # Kaminari.paginate_array って要るんでしたっけ？
      @photos = Kaminari.paginate_array(Photos.find(:all, :limit => 100, :order => 'photo_date asc')).page(params[:page])
    end

    def contacts
      @page_title = t('contacts.title')
    end

  private
  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end
