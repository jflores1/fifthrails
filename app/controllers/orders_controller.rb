class OrdersController < ApplicationController

  def index
    @order = @user.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
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

end
