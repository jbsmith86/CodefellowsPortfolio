class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
     @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      format.html do
        @project.save
        redirect_to @project
      end
      format.js do
        @project.save
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html do
        @project.update_attributes(project_params)
        redirect_to @project
      end
      format.js do
        @project.update_attributes(project_params)
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

private

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
end
