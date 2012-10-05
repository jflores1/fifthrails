class AccountsController < ApplicationController
  #before_filter :get_current_user
  before_filter :signed_in_user

  def show

  end

  def new
    @account = current_user.create_account(params[:account])
    if @account.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @account = current_user.build_account
    if @account.update_attributes(params[:account])
      flash[:success]
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end


end
