class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new_about, :edit_about, :update_about, :destroy]

  def index
    @users = User.all
  end


  def show
  end

  def new_about
    @user.profile = Profile.new
  end

  def create_about
    @user.profile = Profile.create(params[:profile_attributes][user_id: @user.id])
    redirect_to user_path(@user)
  end

  def edit_about
  end

  def update_about
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

  def destroy
    @user.delete
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :role, profile_attributes: [:user_id, :location, :organization, :additional_info])
  end
end
