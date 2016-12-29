class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @vote = Vote.find(params[:vote_id])
    @comment = @vote.build_comment
  end

  def create
    @vote = Vote.find(params[:vote_id])
    @comment = @vote.create_comment(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to city_path(@vote.city_id)
    else
      redirect_to city_path(@vote.city_id)
    end
  end

  def edit
    @vote = Vote.find(params[:vote_id])
  end

  def update
    if current_user.id == @comment.user_id || current_user.admin?
      @comment.update(comment_params)
      redirect_to city_path(@comment.vote.city_id)
    end
  end

  def destroy
    if current_user.id == @comment.user_id || current_user.admin?
      @comment.destroy
      redirect_to user_path(current_user)
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :vote_id, :user_id, vote_attributes:[:id, :vote_ty])
  end
end
