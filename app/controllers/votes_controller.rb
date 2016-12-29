class VotesController < ApplicationController

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.update(vote_params)
    redirect_to city_path(@vote.city_id), notice: "updated vote or comment"
  end

  def upvote
    @city = City.find(params[:id])
    @vote = @city.votes.create(vote_type: 1, user_id: current_user.id)
    if @vote.save
      @city.update_vote_count
      redirect_to city_path(@city), notice: "Upvoted City"
    else
      redirect_to city_path(@city), alert: "Can only cast one vote per city, or voting is currently limited to signed in users"
    end
  end

  def downvote
    @city = City.find(params[:id])
    @vote = @city.votes.create(vote_type: 0, user_id: current_user.id)
    if @vote.save
      @city.update_vote_count
      redirect_to city_path(@city), notice: "Downvoted City"
    else
      redirect_to city_path(@city), alert: "Can only cast one vote per city, or voting is currently limited to signed in users"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:vote_type, comment_attributes: [:id, :content])
  end

end
