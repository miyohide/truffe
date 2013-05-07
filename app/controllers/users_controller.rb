class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @page_title = t('signup.title')
  end
end
