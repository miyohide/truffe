class DiscographiesController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :destroy]

  def index
    @page_title = t('discographies.title')
    @discographies = Discography.order('release_date desc').limit(100)
  end

  def new
    @page_title = t('discographies.title')
    @discography = Discography.new
  end

  def create
    @discography = Discography.new(params[:discography])
    if @discography.save
      flash[:success] = t('discographies.created')
      redirect_to discographies_path 
    else
      @page_title = t('discographies.title')
      render 'new'
    end
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

  def destroy
    Discography.find(params[:id]).destroy
    flash[:success] = t('discographies.deleted')  
    redirect_to discographies_path
  end
end
