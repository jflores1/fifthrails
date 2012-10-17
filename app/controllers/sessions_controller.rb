class SessionsController < ApplicationController

  def new
    if signed_in?
      redirect_to current_user
    else
      render 'new'
    end
  end

  def create
    user = User.find_by_email_address(params[:session][:email_address].downcase)
    if user && user.authenticate(params[:session][:password]) && user.admin?
      sign_in user
      redirect_to '/admin'
    elsif user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end

end
