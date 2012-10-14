class ItemsController < ApplicationController

  def index

  end

  def show

  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.create(params[:item])
    if @item.save!
      redirect_to user_path(current_user)
    else
      render 'new'
    end

  end

  def edit

  end

  def update

  end


end
