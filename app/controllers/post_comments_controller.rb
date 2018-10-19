class PostCommentsController < ApplicationController
  def new
    @post_comment = PostComment.new
  end

  def create
    @post_comment = PostComment.new(post_comment_params)
    @user = current_user
    @post = Post.find(params[:post_id])
    @project = Project.find(params[:project_id])
    redirect_to project_post_path(@project, @post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :post_id, :project_id, :commit)
  end
end