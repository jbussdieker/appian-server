class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @projects = current_user.projects
    if !@projects or @projects.count < 1
      render "welcome"
      return
    end
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
end
