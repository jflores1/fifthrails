class ItemsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index

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
      redirect_to '/users'
    else
      flash[:error]
      render 'new'
    end

  end

  def edit

  end

  def update

  end

  private
  def found_user
    found_user = User.find(params[:user_id])
  end


end
