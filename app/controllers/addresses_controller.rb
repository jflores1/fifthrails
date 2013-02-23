class AddressesController < ApplicationController
  before_filter :authenticate_user!, :load_user
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @addresses = @user.addresses
  end

  def show
    @user = User.find(params[:id])
    @address = @user.address.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @address = @user.addresses.build(params[:address])
    if @address.save!
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

  protected
  def load_user
    @user = User.find(params[:user_id])
  end

end
