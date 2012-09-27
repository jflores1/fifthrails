class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    user = User.find_by_email_address(params[:session][email].downcase)
    if user && user.authenticate(params[:session][:password])
      #sign in and redirect
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
