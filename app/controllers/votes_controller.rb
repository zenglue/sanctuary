class VotesController < ApplicationController

  def show
    @city = City.find(params[:id])
    @vote =Vote.find(params[:id])
    redirect_to city_path(@city)
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
