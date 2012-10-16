class AddressesController < ApplicationController

  def index
    @address = current_user.addresses.all
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = current_user.addresses.build
  end

  def create
    @address = current_user.addresses.build(params[:address])
    if @address.save! && current_user.addresses.first
      redirect_to new_order_path(current_user)
    elsif @address.save!
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @address = current_user.addresses.build(params[:id])
  end

  def update
    @address = current_user.addresses.build(params[:address])
    if @address.update_attributes(params[:address])
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

end
