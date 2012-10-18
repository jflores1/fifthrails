class ItemsController < ApplicationController
  before_filter :get_user
  before_filter :authorize, except: [:show]


  def get_user
    @user = User.find(params[:user_id])
  end

  def index
    @item = @user.items
  end

  def show
    @item = @user.items.find(params[:id])
  end

  def new
    @item = @user.items.build
  end

  def create
    @item = @user.items.build(params[:item])
    if @item.save!
      flash[:success]
      redirect_to user_items_path(@user)
    else
      flash[:error]
      render '/users'
    end

  end

  def edit
    @item = @user.items.find(params[:id])
  end

  def update
    @item = @user.items.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:success] = "Item Updated"
      redirect_to user_items_path(@user)
    else
      flash[:error] = "There was a problem with the form"
      render 'edit'
    end

  end

  def destroy
    @item = @user.items.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.js
    end
  end


end
