class CommentsController < ApplicationController

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
