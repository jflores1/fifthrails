class OrdersController < ApplicationController
  before_filter :signed_in_user

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = current_user.orders.build
    @address = @order.addresses
  end

  def create
    @order = current_user.orders.build(params[:order])
    if @order.save!
      redirect_to user_path(current_user)
    else
      render 'new'
    end

  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = current_user.orders.update_attributes(params[:order])
    if @order.save!
      flash[:success]
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def address_nickname
    Address.joins(:orders).where(:id == order.addres_id)
  end

end
