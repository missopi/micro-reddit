# frozen_string_literal: true

# controller for comments
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:body))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.where(post_id: @post.id)
    @comment.each(&:destroy)
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
