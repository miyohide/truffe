class GigsController < ApplicationController
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

    @gigs = Gigs.where('EXTRACT(MONTH FROM gig_date) = ? and EXTRACT(YEAR FROM gig_date) = ?', @gig_month, @gig_year).limit(100).offset(0).page(params[:page])

    if @gig_year.nil? || @gig_month.nil?
      @prev_year = Date.today.year
      @next_year = Date.today.year
      @prev_month = Date.today.month
      @next_month = Date.today.month
    else
      @current_date = (Date.new(@gig_year, @gig_month))
    end
  end
end
