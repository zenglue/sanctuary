class CitiesController < ApplicationController

  before_action :set_city, only: [:show, :upvote, :downvote, :edit, :destroy]

  def index
    cities = City.order(:name)
    @sanctuary_cities = cities.where(official_status: 3)
    @possible_cities = cities.where(official_status: 2)
    @non_cities = cities.where(official_status: 1)
    @unknown_cities = cities.where(official_status: 0)
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    if current_user.admin?
      @city = City.create(city_params)
      redirect_to city_path(@city)
    end
  end

  def upvote
    if current_user
      @vote = @city.votes.create(vote_type: 1, user_id: current_user.id, city_id: @city.id)
    elsif current_user.nil?
      @vote = @city.votes.create(vote_type: 1, user_id: 0, city_id: @city.id)
    end
    if @vote.save
      redirect_to city_path(@city), notice: "Upvoted City"
    else
      redirect_to city_path(@city), alert: "Can only cast one vote per city"
    end
  end

  def downvote
    @vote = @city.votes.create(vote_type: 0, user_id: current_user, city_id: @city.id)
    if @vote.save
      redirect_to city_path(@city), notice: "Downvoted City"
    else
      redirect_to city_path(@city), alert: "Can only cast one vote per city"
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
    if current_user.admin?
      @city.destroy
      redirect_to cities_path, notice: "City was removed"
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :state, :official_status)
  end
end
