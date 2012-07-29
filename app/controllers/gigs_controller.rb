class GigsController < ApplicationController
  def index
    @gig_year  = Date.today.year  unless params[:year] 
    @gig_month = Date.today.month unless params[:month]
    unless params[:year].blank?
      unless params[:year].to_i < 2010 || params[:year].to_i > 2200
        @gig_year  = params[:year].to_i
      else
        @gig_year  = Date.today.year
      end
    end
    unless params[:month].blank?
      unless params[:month].to_i <= 0 || params[:month].to_i >= 13
        @gig_month = params[:month].to_i
      else
        @gig_month  = Date.today.month
      end
    end

    @gigs = Kaminari.paginate_array(Gigs.find(:all, :conditions => ['month(gig_date) = ? AND year(gig_date) = ?', @gig_month, @gig_year], :limit => 100, :order => 'gig_date asc')).page(params[:page])

    unless @gig_year || @gig_month
      @prev_year = Date.today.year 
      @next_year = Date.today.year 
      @prev_month = Date.today.month 
      @next_month = Date.today.month 
    else
      unless @gig_month <= 1
        @prev_year = @gig_year
        @prev_month = @gig_month - 1
      else
        @prev_year = @gig_year - 1
        @prev_month = 12
      end
      unless @gig_month >= 12
        @next_year = @gig_year
        @next_month = @gig_month + 1
      else
        @next_year = @gig_year + 1
        @next_month = 1
      end
    end
  end
end
