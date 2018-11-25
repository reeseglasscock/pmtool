class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(current_post)
    @project = Project.find(@post.project.id)
    if @comment.save
      @user = current_user
      @comment.user = @user
      redirect_to project_post_path(@project, @post)
    else
      redirect_to project_post_path(@project, @post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end

  def current_post
    params[:comment][:post_id]
  end

end