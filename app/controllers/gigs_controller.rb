class GigsController < ApplicationController
  def index
    unless params[:month] || params[:year]
      @gig_year  = Date.today.year
      @gig_month = Date.today.month
    else
      @gig_year  = params[:year]
      @gig_month = params[:month]
    end
    @gigs = Kaminari.paginate_array(Gigs.find(:all, :conditions => ['month(gig_date) = ? AND year(gig_date) = ?', @gig_month, @gig_year], :limit => 100, :order => 'gig_date asc')).page(params[:page])
  end
end
