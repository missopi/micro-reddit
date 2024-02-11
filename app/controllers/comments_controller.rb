# frozen_string_literal: true

# controller for comments
class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :current_user, only: %i[create destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to @post, notice: 'Post was successfully commented.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: 'post not commented' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.where(post_id: @post.id)
    @comment.each(&:destroy)
    redirect_to post_path(@post)
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
