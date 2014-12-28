class GigsController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @page_title = t('gigs.title')
    @current_date = params[:target_date].present? ? Date.parse(params[:target_date]) : Date.today

    if signed_in?
      @gigs = Gig.where('gig_date >= ? and gig_date <= ?', @current_date.beginning_of_month, @current_date.end_of_month).order("start_time ASC").limit(100).offset(0).page(params[:page])
    else
      @gigs = Gig.where('visible = ? and gig_date >= ? and gig_date <= ?', false, @current_date.beginning_of_month, @current_date.end_of_month).order("start_time ASC").limit(100).offset(0).page(params[:page])
    end
  end

  def new
    @page_title = t('gigs.new')
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(params[:gig])
    if @gig.save
      flash[:success] = t('gigs.created')
      redirect_to gigs_path
    else
      @page_title = t('gigs.new')
      render'new'
    end
  end
    
  def edit
    @page_title = t('gigs.title')
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    if @gig.update_attributes(params[:gig])
      flash[:success] = t('gigs.updated')
      redirect_to :action => 'index'
      # todo
      # 編集したライブ情報の月のページへ遷移する
    else
      @page_title = t('gigs.title')
      render 'edit'
    end
  end

  def destroy
    Gig.find(params[:id]).destroy
    flash[:success] = t('gigs.deleted')
    redirect_to gigs_path
  end
end
