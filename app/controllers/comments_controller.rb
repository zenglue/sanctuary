class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @comment = Comment.new(vote_id: params[:vote_id], user_id: params[:user_id])
  end

  def create
    @comment = Comment.create!(comment_params)
    redirect_to comment_path(@comment)
  end

  def edit
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
    params.require(:comment).permit(:content, :vote_id, :user_id)
  end
end
