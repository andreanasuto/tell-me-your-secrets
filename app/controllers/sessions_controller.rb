class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_secrets_path(user)
    else
      #create a error message. let the user know what's wrong.
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id].destroy
  end

end
