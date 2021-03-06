class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  def authentification_required
    if !logged_in?
      redirect_to login_path
    end
  end

end
