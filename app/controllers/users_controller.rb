class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end


  def show
  end

  def make_admin
    @user = User.find(params[:id])
    if current_user.admin?
      @user.convert_user_to_admin
      redirect_to user_path(@user), notice: "User is now an Admin"
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :role)
  end
end
