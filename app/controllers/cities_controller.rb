class CitiesController < ApplicationController

  before_action :set_city, only: [:show, :edit, :destroy]

  def index
    cities = City.order_by_votes
    @sanctuary_cities = cities.sanctuary
    @possible_cities = cities.possible_sanctuary
    @non_cities = cities.non_sanctuary
    @unknown_cities = cities.unknown
  end

  def show
    @city.votes.each do |vote|
      if vote.user_id == current_user.id
        @vote = vote
        if vote.comment.present?
          @comment = vote.comment
        end
      end
    end
  end

  def new
    @city = City.new
  end

  def create
    if current_user.admin?
      @city = City.new(city_params)
      if @city.valid?
        @city.save
        redirect_to city_path(@city)
      else
        render :new
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
      if @city.save
        redirect_to city_path(@city)
      else
        render :edit
      end
    end
  end

  def upvote
    @city = City.find(params[:city_id])
    @vote = @city.votes.create(vote_type: 1, user_id: current_user.id)
    if @vote.save
      @city.update_vote_count
      redirect_to city_path(@city), notice: "Upvoted City"
    else
      redirect_to city_path(@city), alert: "Can only cast one vote per city, or voting is currently limited to signed in users"
    end
  end

  def downvote
    @city = City.find(params[:city_id])
    @vote = @city.votes.create(vote_type: 0, user_id: current_user.id)
    if @vote.save
      @city.update_vote_count
      redirect_to city_path(@city), notice: "Downvoted City"
    else
      redirect_to city_path(@city), alert: "Can only cast one vote per city, or voting is currently limited to signed in users"
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
