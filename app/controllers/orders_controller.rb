class OrdersController < ApplicationController
  before_filter :authenticate_user!, :load_user
  load_and_authorize_resource

  def index
    @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
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

  def destroy
    @order = @user.orders.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.js
    end
  end

  def complete_order
    @order = Order.find(params[:id])
    @order.update_column(:order_status, "Complete")
    @order.save!
    respond_to do |format|
        format.js
    end
  end

  def load_user
    @user = User.find(params[:user_id])
  end

end
