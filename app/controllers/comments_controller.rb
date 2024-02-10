# frozen_string_literal: true

# controller for comments
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
