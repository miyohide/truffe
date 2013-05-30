class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @page_title = @user.name
  end

  def new
    @user = User.new
    @page_title = t('signup.title')
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # tab
      sign_in @user
      flash[:success] = "Welcome to Your Profile Page!"
      redirect_to @user
    else
      @title = t('signup.title')
      render 'new'
    end
  end
end
