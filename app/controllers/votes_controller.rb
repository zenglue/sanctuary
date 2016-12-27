class VotesController < ApplicationController

  def upvote
    @city = City.find(params[:city])
    @vote = Vote.create(vote_type: 1, user_id: current_user.id, city_id: @city.id)
    if @vote.save
      @city.update_vote_count
      redirect_to city_path(@city), notice: "Upvoted City"
    else
      redirect_to city_path(@city), alert: "Can only cast one vote per city, or voting is currently limited to signed in users"
    end
  end

  def downvote
    @city = City.find(params[:city])
    @vote = Vote.create(vote_type: 0, user_id: current_user.id, city_id: @city.id)
    if @vote.save
      @city.update_vote_count
      redirect_to city_path(@city), notice: "Downvoted City"
    else
      redirect_to city_path(@city), alert: "Can only cast one vote per city, or voting is currently limited to signed in users"
    end
  end
end
