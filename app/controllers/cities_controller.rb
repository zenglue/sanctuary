class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city
  end

  def upvote
    @city = City.find(params[:id])
    @vote = Vote.new(type: 1, user_id: current_user.id, city_id: @city.id)
    if @vote.save
      redirect_to city_path(@city), notice: "Upvoted City"
    else
      redirect_to city_path(@city), error: "Can only cast one vote"
    end
  end

  def downvote
    @city = City.find(params[:id])
    @vote = Vote.create(type: 0, user_id: current_user.id, city_id: @city.id)
    if @vote.save
      redirect_to city_path(@city), notice: "Downvoted City"
    else
      redirect_to city_path(@city), error: "Can only cast one vote"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

end
