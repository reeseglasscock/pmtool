# frozen_string_literal: true

class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    binding.pry
    if @post.save
      @user = current_user
      @user.posts << @post
      flash[:success] = 'New Post Created'
    else
      flash[:error] = 'Please check again'
    end
    redirect_to 'projects/'
  end

  private

  def post_params
    params.permit(:comment, :project_id)
  end
end