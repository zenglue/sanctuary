class CitiesController < ApplicationController

  before_action :set_city, only: [:show, :upvote, :downvote, :edit, :destroy]

  def index
    cities = City.order_by_votes
    @sanctuary_cities = cities.sanctuary
    @possible_cities = cities.possible_sanctuary
    @non_cities = cities.non_sanctuary
    @unknown_cities = cities.unknown
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    if current_user.admin?
      @city = City.create(city_params)
      if @city.save
        redirect_to city_path(@city)
      else
        redirect_to cities_path, error: "All fields must be present"
      end
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
