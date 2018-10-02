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
    @user = User.find(params[:user][:user_id])
    @project = Project.find(params[:id])
    if @user.projects.include?(@project)
        flash[:error]= 'This user is already included in this project'
        redirect_to project_path(@project)
      else
        @user.projects << @project
        flash[:error]= "#{@user.name} has been added to #{@project.title}"
        redirect_to projects_path
      end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
