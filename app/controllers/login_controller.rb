# -*- encoding: utf-8 -*-
class LoginController < ApplicationController
  verify :method => :post,
         :only => [ :login ],
		 :redirect_to => 'root_path'

  def login
    email = params[:email]
    password = params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
    else
      session[:user_id] = nil
      flash[:warning] = 'ログイン失敗'
      flash[:email] = email
    end
    if params[:from]
      redirect_to params[:from]
    else
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
