class UsersController < ApplicationController
  def index
    @users = User.where("username <> ?", current_user.username).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end
end