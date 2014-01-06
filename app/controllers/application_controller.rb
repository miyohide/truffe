class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :set_locale

  private

  # def current_user
    # @_current_user ||= User.find_by_id(session[:user_id]) でも同じだと思う
    # @_current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  # end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def authenticate
     deny_access unless signed_in?
  end
end
