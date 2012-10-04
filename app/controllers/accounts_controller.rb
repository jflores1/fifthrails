class AccountsController < ApplicationController
  #before_filter :get_current_user
  before_filter :signed_in_user

  def new
    if signed_in?
      @user = current_user
      @account = @user.accounts.build(params[:account])
      if @account.save
        redirect_to user_path(current_user)
      else
        render 'new'
      end
    else
      redirect_to signin_path
    end
  end

  def edit
    @user = current_user
    @account = @user.accounts.last
    if @account.update_attributes(params[:account])
      flash[:success] = "profile updated!"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end


end
