class GigsController < ApplicationController
  def index
    unless params[:month] || params[:year]
      @gig_year  = Date.today.year
      @gig_month = Date.today.month
    else
      @gig_year  = params[:year].to_i
      @gig_month = params[:month].to_i
    end

    @gigs = Kaminari.paginate_array(Gigs.find(:all, :conditions => ['month(gig_date) = ? AND year(gig_date) = ?', @gig_month, @gig_year], :limit => 100, :order => 'gig_date asc')).page(params[:page])

    unless @gig_year || @gig_month
      @prev_year = Date.today.year 
      @next_year = Date.today.year 
      @prev_month = Date.today.month 
      @next_month = Date.today.month 
    else
      unless @gig_month == 1
        @prev_year = @gig_year
        @prev_month = @gig_month - 1
      else
        @prev_year = @gig_year - 1
        @prev_month = 12
      end
      unless @gig_month == 12
        @next_year = @gig_year
        @next_month = @gig_month + 1
      else
        @next_year = @gig_year + 1
        @next_month = 1
      end
    end
  end
end
