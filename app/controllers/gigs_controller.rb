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

    # ここってGigs.where("EXTRACT...")って感じではダメでしょうか。
    #
    # -> 書き直しました！普通にwhere句の中で使えました。ありがとうございます。
    @gigs = Kaminari.paginate_array(Gigs.where('EXTRACT(MONTH FROM gig_date) = ? and EXTRACT(YEAR FROM gig_date) = ?', @gig_month, @gig_year).limit(100).offset(0)).page(params[:page])

    # 条件文はなるべくifで始まる形にしたほうがわかりやすいです。
    # 特に条件部分に || や && ははいる場合はifに変換すべし。
    #
    # -> 変えました！
    if @gig_year.nil? || @gig_month.nil?
      @prev_year = Date.today.year
      @next_year = Date.today.year
      @prev_month = Date.today.month
      @next_month = Date.today.month
    else
      # ここらへん、1.month.since((Date.new(@gig_year, @gig_month))でを使えばすっきりしそう。 1.month.agoもあります。
      # see: http://guides.rubyonrails.org/active_support_core_extensions.html#extensions-to-date
      #
      # ->  ありがとうございます。確かに、Datetimeとして扱えばもっと簡潔に書けるところでした！
      current_date = (Date.new(@gig_year, @gig_month))
      @prev_month = current_date.prev_month
      @next_month = current_date.next_month
    end
  end
end
