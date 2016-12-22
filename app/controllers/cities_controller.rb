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
    if current_user.admin?
      @city = City.create(city_params)
      redirect_to city_path(@city)
    end
  end

  def upvote
    if @city.votes.create(vote_type: 1, user_id: current_user, city_id: @city.id)
      redirect_to city_path(@city), notice: "Upvoted City"
    else
      redirect_to city_path(@city), notice: "Can only cast one vote"
    end
  end

  def downvote
    @vote = Vote.create(vote_type: 0, user_id: current_user, city_id: @city.id)
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
