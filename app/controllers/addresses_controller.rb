class AddressesController < ApplicationController
  before_filter :get_user

  def get_user
    if current_user.admin?
      @user = User.find(params[:user_id])
    else
      @user = current_user
    end
  end

  def index
    @address = @user.addresses.all
  end

  def show
    @address = @user.addresses.find(params[:id])
  end

  def new
    @address = @user.addresses.build
  end

  def create
    @address = @user.addresses.build(params[:address])
    if @address.save! && @user.addresses.count == 1 #this needs to be scoped out and moved to model.
      redirect_to new_order_path(@user)
    elsif @address.save!
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @address = @user.addresses.find(params[:id])
  end

  def update
    @address = @user.addresses.find(params[:id])
    if @address.update_attributes(params[:address])
      redirect_to user_addresses_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @address = @user.addresses.find(params[:id])
    @address.destroy
    redirect_to user_addresses_path(@user)
  end

end
