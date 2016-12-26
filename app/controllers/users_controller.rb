class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end

  def show_new
    @user = User.new
  end

  def show_create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show_edit
  end

  def show_update
    if current_user.id == @user.id || current_user.admin?
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to '/', error: "Access denied"
    end
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
    params.require(:user).permit(:username, :email, :password, :role, profile_attributes: [:location, :organization, :additional_info])
  end
end
