class VotesController < ApplicationController

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update(vote_params)
      if @vote.valid?
        redirect_to city_path(@vote.city_id), notice: "updated vote or comment"
      else
        render :edit
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:vote_type, comment_attributes: [:content])
  end
end
