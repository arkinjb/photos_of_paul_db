class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url
    else
      flash.now[:sign_in_error] = 'Invalid username/password combination'
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end


end
