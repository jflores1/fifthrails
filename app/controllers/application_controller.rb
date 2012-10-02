class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :get_current_user=

  def get_current_user=(user)
    @current_user = user
  end


end
