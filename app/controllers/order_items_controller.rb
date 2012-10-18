class OrderItemsController < ApplicationController
  before_filter :get_user

  def new
    @order = @user.orders.build(params[:order_id])
    @order_item = @order.order_items.build
    @item = @user.items
    @address = @user.addresses
  end

  def create
    @order = @user.orders
    @order_item = @order.order_items.build(params[:order])
    if @order_item.save!
      redirect_to user_path(current_user)
    else
      render 'new'
    end

    def edit
      @order = @user.orders.find(params[:order_id])
      @order_item = @order.order_items.find(params[:order_id])
      @item = @user.items
      @address = @user.addresses
    end

    def update
      @order_item = @user.orders.find(params[:order_id])
      if @order_item.update_attributes(params[:order_items])
        flash[:success]
        render user_path(@user)
      else
        flash[:error]
        render user_path(@user)
      end
    end

  end


end
