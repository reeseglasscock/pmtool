# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    if current_user
      @user_projects = current_user.projects.recent.page(page_number).per(9)
      authorize @user_projects
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    authorize @project
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
    authorize @project
    @project_owner = User.find(@project.owner)
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    @all_users = []
    for user in params[:project][:user_ids] do
      @user = User.find(user)
      @all_users.push(@user.name)
      if @user.projects.include?(@project)
        flash[:error]= 'This user is already included in this project'
      else
        @user.projects << @project
        @project.update(updated_at: Time.now)
      end
    end
    if @all_users.length >= 1
      flash[:success]= "#{@all_users.join(", ")} have been added to #{@project.title}"
    end
  end

  def destroy_user
    @user = User.find(params[:project_id])
    @project = Project.find(params[:project])
    authorize @project
    @user_on_project = ProjectsUser.where(user: @user, project: @project)
    @user_on_project.destroy_all
    flash[:success] = "#{@user.name} has been removed from #{@project.title}"
    respond_to do |format|
      format.js
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def page_number
    params[:page]
  end
end
