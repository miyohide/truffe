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

  def edit
    @page_title = t('articles.title')
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:success] = t('articles.updated')
      redirect_to :action => 'index'
    else
      @page_title = t('articles.title')
      render 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = t('articles.deleted')
    redirect_to articles_path
  end
end
