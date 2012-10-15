class OrderItemsController < ApplicationController
  before_filter :current_user

  def new
    @order = current_user.orders.build
    @order_item = @order.order_items.build
    @item = current_user.items
    @address = current_user.addresses
  end

  def create
    @order = current_user.orders
    @order_item = @order.order_items.build(params[:order])
    if @order_item.save!
      redirect_to user_path(current_user)
    else
      render 'new'
    end

  end


end
