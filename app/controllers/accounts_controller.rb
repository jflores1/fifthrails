class AccountsController < ApplicationController
  #before_filter :get_current_user
  before_filter :signed_in_user

  def show

  end

  def new
    @account = current_user.build_account(params[:account])
    if :post
      process_action 'create'
    end
  end

  def create
    @account = current_user.create_account(params[:account])
    if @account.save
      flash[:success] = 'Account created!'
      redirect_to user_path(current_user)
    else
      render'new'
    end
  end

  def edit
    @account = current_user.build_account(params[:account])
    if :post
      process_action 'update'
    end
  end

  def update
    @account = current_user.build_account
    if @account.update_attributes(params[:account])
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end


end
