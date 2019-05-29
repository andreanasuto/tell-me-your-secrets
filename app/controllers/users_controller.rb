class UsersController < ApplicationController
  before_action :authentification_required, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to new_secret_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to new_secret_path, alert: "You don't have access to this user, you have been redirected"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
