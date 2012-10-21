class AdminController < ApplicationController
  before_filter :authorize

  def index
    @order = Order.active.all
  end

end
