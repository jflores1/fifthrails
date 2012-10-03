class AccountsController < ApplicationController
  #before_filter :get_current_user
  before_filter :signed_in_user

  def show
    @account = current_user.account.find(params[:id])
  end

  def new
    @user = current_user
    @account = @user.create_account(params[:account])

  end

  def create
    #@account = @user.create_account(params[:account])

    if @account.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @account = current_user.account
  end

  def update
    @account = current_user.build_account

    if @account.update_attributes(params[:account])
      flash[:success] = "Account Updated"
      redirect_to current_user
    else
      flash[:error]
      redirect_to 'edit'
    end

  end

end
