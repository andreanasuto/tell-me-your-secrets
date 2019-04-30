class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to new_secret_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def delete
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest)
  end
end
