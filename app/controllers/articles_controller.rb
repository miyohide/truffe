class ArticlesController < ApplicationController
  def index
    @page_title = t('articles.title')
    @articles = Article.limit(100).page(params[:page])
  end
end
