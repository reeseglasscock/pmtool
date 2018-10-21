class PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post = Post.find(current_post)
    @project = Project.find(@post.project.id)
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
    params.require(:post_comment).permit(:comment, :post_id, :user_id)
  end

  def current_post
    params[:post_comment][:post_id]
  end

end