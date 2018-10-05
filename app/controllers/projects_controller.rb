# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @user = current_user
    if @project.save
      @user.projects << @project
      @project.update(owner: @user.id)
      flash[:success] = 'New Project Created'
      redirect_to '/projects'
    else
      flash[:error] = 'Please check again'
      redirect_to '/projects/new'
    end
  end

  def show
    @project =  Project.find(params[:id])
    @project_owner = User.find(@project.owner)
  end

  def update
    @project = Project.find(params[:id])
    @all_users = []
    for user in params[:project][:user_ids] do
      @user = User.find(user)
      @all_users.push(@user.name)
      if @user.projects.include?(@project)
        flash[:error]= 'This user is already included in this project'
      else
        @user.projects << @project
        flash[:success]= "#{@all_users.join(", ")} have been added to #{@project.title}"
      end
    end
    redirect_to project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
