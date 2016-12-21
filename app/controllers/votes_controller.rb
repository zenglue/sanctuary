class VotesController < ApplicationController


  def new
    @vote = Vote.new
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
    @vote = Vote.new(type: 0, user_id: current_user.id, city_id: @city.id)
    if @vote.save
      redirect_to city_path(@city), notice: "Downvoted City"
    else
      redirect_to city_path(@city), error: "Can only cast one vote"
    end
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    if current_user.id = @vote.user_id
      @vote.update(params[:type])
      redirect_to city_path(@vote.city_id), notice: "Vote changed"
    else
      redirect_to '/', error: "No trolls please."
    end
  end
end
