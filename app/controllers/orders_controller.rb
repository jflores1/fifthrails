class OrdersController < ApplicationController
  before_filter :signed_in_user
  before_filter :get_user

  def index
    @order = @user.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = @user.orders.build
    @address = @user.addresses
  end

  def create
    @order = @user.orders.build(params[:order])
    if @order.save!
      redirect_to user_path(@user)
    else
      render 'new'
    end

  end

  def edit
    @order = @user.orders.find(params[:user_id])
  end

  def update
    @order = @user.orders.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:success]
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

end
