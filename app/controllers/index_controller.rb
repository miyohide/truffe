class IndexController < ApplicationController
  USERS = { "aaaa" => "bbbb" }

  before_filter :authenticate

    def index
      #@discographies = Discographies.order('release_date desc').limit(1)
      @articles = Article.limit(5)
    end

    def profile
      @page_title = t('profile.title')
      @basic_data = BasicData.find(1)
    end

    def photos
      @page_title = t('photos.title')
      @photos = Photo.order('photo_date asc').limit(100).page(params[:page])
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
