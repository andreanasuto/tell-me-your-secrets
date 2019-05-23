class SessionsController < ApplicationController

  def new
  end

  def create
    if !auth_hash.nil?
      user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = user.id
      redirect_to new_secret_path
    else
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to new_secret_path
      else
        #create a error message. let the user know what's wrong.
        redirect_to login_path
      end
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end

protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
