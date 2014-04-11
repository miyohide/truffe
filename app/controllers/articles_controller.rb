class ArticlesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @page_title = t('articles.title')
    @articles = Article.limit(100).page(params[:page])
  end

  def new
    @page_title = t('articles.new')
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:success] = t('articles.created')
      redirect_to articles_path
    else
      @page_title = t('articles.new')
      render'new'
    end
  end
end
