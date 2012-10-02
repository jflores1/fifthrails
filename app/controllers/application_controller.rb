class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :get_current_user

  def get_current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end


end
