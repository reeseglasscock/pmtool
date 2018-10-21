class PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post = Post.find(params[:post_id])
    @project = Project.find(@post.project.id)
    binding.pry
    if @post_comment.save
      @user = current_user
      @post_comment.user = @user
      redirect_to project_post_path(@project, @post)
    else
      redirect_to project_post_path(@project, @post)
    end
  end

  private

  def post_comment_params
    params.permit(:comment, :post_id)
  end

end