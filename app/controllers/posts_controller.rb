class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    if @post.save
      @user.posts << @post
      flash[:success] = 'New Post Created'
    else
      flash[:error] = 'Please check again'
    end
  end
end