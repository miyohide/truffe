class GigsController < ApplicationController
  # Trailing whitespaceがあります
  # vimだったら:%s/ $//g で消せます。
  #
  def index
    @page_title = t('gigs.title')

    # ここは条件が変な気が。 y < 2010 and y > 2200 は存在しないです。
    @gig_year = unless params[:year] && (params[:year].to_i < 2010 || params[:year].to_i > 2200)
                  params[:year].to_i
                else
                  Date.today.year
                end

    @gig_year = unless params[:month] && params[:month].between? 1, 12
                  params[:month].to_i
                else
                  Date.today.month
                end

    # ここってGigs.where("EXTRACT...")って感じではダメでしょうか。
    @gigs = Kaminari.paginate_array(Gigs.find_by_sql(["SELECT * FROM gigs WHERE (EXTRACT(MONTH FROM gig_date) = :month AND EXTRACT(YEAR FROM gig_date) = :year) LIMIT 100 OFFSET 0;", {:month => @gig_month, :year => @gig_year}])).page(params[:page])

    # 条件文はなるべくifで始まる形にしたほうがわかりやすいです。
    # 特に条件部分に || や && ははいる場合はifに変換すべし。
    unless @gig_year || @gig_month
      @prev_year = Date.today.year
      @next_year = Date.today.year
      @prev_month = Date.today.month
      @next_month = Date.today.month
    else
      # ここらへん、1.month.since((Date.new(@gig_year, @gig_month))でを使えばすっきりしそう。 1.month.agoもあります。
      # see: http://guides.rubyonrails.org/active_support_core_extensions.html#extensions-to-date
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
