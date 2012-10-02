class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    user = User.find_by_email_address(params[:session][:email_address].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in
      redirect_to user
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
