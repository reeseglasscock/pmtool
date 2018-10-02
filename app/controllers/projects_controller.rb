# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @user = current_user
    if @project.save
      @user.projects << @project
      flash[:success] = 'New Project Created'
      redirect_to '/projects'
    else
      flash[:error] = 'Please check again'
      redirect_to '/projects/new'
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
