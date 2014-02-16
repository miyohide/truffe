class IndexController < ApplicationController
  #before_filter :digest_authenticate

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

    unless params[:contact]
      @contact = Contact.new
    else
      @contact = Contact.new(params[:contact])
      render @contact.valid? ? :confirm : :contacts
    end
  end

  def send_inquiry
    @page_title = t('contacts.title')

    @contact = params[:contact]
    # TODO send mail
    flash[:notice] = t('contacts.message')
    redirect_to contacts_path
  end
end
