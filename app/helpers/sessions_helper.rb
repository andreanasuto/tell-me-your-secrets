module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    # .nil? return true if the method current_user returns nil.
    # We want it to return true, if current_user is NOT nil so we use '!'
    !current_user.nil?
  end
end
