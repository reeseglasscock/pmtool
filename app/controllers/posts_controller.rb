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
    @project = Project.find(project_params[:project_id])

    if @post.save
      @user = current_user
      @user.posts << @post
      @project.update(updated_at: Time.now)
      flash[:success] = 'New Post Created'
    else
      flash[:error] = 'Please fill in all required fields.'
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @project = Project.find(params[:project_id])
  end

  private

  def post_params
    params.permit(:comment, :project_id, :title)
  end

  def project_params
    params.permit(:project_id)
  end
end