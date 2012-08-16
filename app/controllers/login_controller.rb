# -*- encoding: utf-8 -*-
class LoginController < ApplicationController
  def login
    login_id = params[:email]
    password = params[:password]

    if user = User.authenticate(login_id, password)
      session[:user_id] = user.id
    else
      session[:user_id] = nil
      flash[:warning] = 'ログイン失敗'
      flash[:email] = login_id
    end

    if params[:from]
      redirect_to params[:from]
    else
      redirect_to root_path
    end
  end

  def logout
    @_current_user = session[:user_id] = nil
    flash[:notice] = t('messages.logout')
    redirect_to root_path
  end
end
