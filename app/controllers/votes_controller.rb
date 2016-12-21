class VotesController < ApplicationController


  def create
    @vote = Vote.create
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
