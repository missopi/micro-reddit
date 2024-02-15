# frozen_string_literal: true

# controller for comments
class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.post_id = @post.id
    @comment.save!

    respond_to do |format|
      format.html { redirect_to @post, notice: 'Post was successfully commented.' }
      format.json { render :show, status: :created, location: @post }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
