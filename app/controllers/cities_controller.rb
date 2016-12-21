class CitiesController < ApplicationController

  before_action :set_city, only: [:show, :upvote, :downvote, :edit, :destroy]

  def index
    @cities = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create(city_params)
    redirect_to city_path(@city)
  end

  def upvote
    @vote = Vote.create(type: 1, user_id: current_user.id, city_id: @city.id)
    if @vote.save
      redirect_to city_path(@city), notice: "Upvoted City"
    else
      redirect_to city_path(@city), error: "Can only cast one vote"
    end
  end

  def downvote
    @vote = Vote.create(type: 0, user_id: current_user.id, city_id: @city.id)
    if @vote.save
      redirect_to city_path(@city), notice: "Downvoted City"
    else
      redirect_to city_path(@city), error: "Can only cast one vote"
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    if current_user.admin?
      @city = City.find(params[:id])
      @city.update(city_params)
      redirect_to city_path(@city)
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_path, notice: "City was removed"
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :state, :official_status)
  end
end
