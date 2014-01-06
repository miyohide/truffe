class GigsController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @page_title = t('gigs.title')

    @gig_year  = unless params[:year] && (params[:year].to_i >= 2010 && params[:year].to_i <= 2200)
                   Date.today.year
                 else
                   params[:year].to_i
                 end
    @gig_month = unless params[:month] && params[:month].to_i.between?(1, 12)
                   Date.today.month
                 else
                   params[:month].to_i
                 end

    @gigs = Gig.where('EXTRACT(MONTH FROM gig_date) = ? and EXTRACT(YEAR FROM gig_date) = ?', @gig_month, @gig_year).limit(100).offset(0).page(params[:page])

    if @gig_year.nil? || @gig_month.nil?
      @prev_year = Date.today.year
      @next_year = Date.today.year
      @prev_month = Date.today.month
      @next_month = Date.today.month
    else
      @current_date = (Date.new(@gig_year, @gig_month))
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
