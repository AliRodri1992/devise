class UsersController < ApplicationController
  def index
    @users = User.joins(:roles).where("roles.name = 'externo'")
  end

  def show

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end
end