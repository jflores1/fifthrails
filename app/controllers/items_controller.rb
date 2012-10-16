class ItemsController < ApplicationController
  before_filter :authorize, except: [:show]

  def index
    @user = User.find(params[:user_id])
    @item = @user.items.all
  end

  def show
    @user = User.find(params[:id])
    @item = @user.items.all

  end

  def new
    @user = User.find(params[:user_id])
    @item = @user.items.build
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(params[:item])
    if @item.save!
      flash[:success]
      redirect_to new_user_item_path(@user)
    else
      flash[:error]
      render '/users'
    end

  end

  def edit

  end

  def update

  end

  def destroy
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_items_path(@user)
  end

  private
  def found_user
    found_user = User.find(params[:user_id])
  end


end
