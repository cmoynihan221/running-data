# frozen_string_literal: true

class CommentController < ApplicationController
  def index
    render json: comments
  end

  def create
    render json: Comment.create!(comment_params)
  end

  private

  def comments
    if comment_params[:activity_id]
      Activity.find(comment_params[:activity_id]).comments
    elsif comment_params[:user_id]
      User.find(comment_params[:user_id]).comments
    else
      Comment.all
    end
  end

  def comment_params
    params.permit(:user_id, :activity_id, :message)
  end
end
