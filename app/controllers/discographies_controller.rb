class DiscographiesController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]

  def index
    @page_title = t('discographies.title')
    @discographies = Discography.order('release_date desc').limit(100)
  end

  def edit
    @page_title = t('discographies.title')
    @discography = Discography.find(params[:id])
  end

  def update
    @discography = Discography.find(params[:id])
    if @discography.update_attributes(params[:discography])
      flash[:success] = t('discographies.updated')
      redirect_to :action => 'index'
    else
      @page_title = t('discographies.title')
      render 'edit'
    end
  end
end
