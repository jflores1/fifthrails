class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @user = User.includes(:items).all
  end

  def show
    @user = User.find(params[:id])
    @order = @user.orders
    @item = @user.items.all
  end

  def new
    if signed_in?
      @user = current_user
      redirect_to @user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to new_user_address_path(current_user)
    else
      flash[:error] = "Sorry, something went wrong"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Password saved"
      sign_in @user
      redirect_to @user
    else
      redirect_to 'edit'
    end

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end



end
