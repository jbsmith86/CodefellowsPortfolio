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
    @project.save
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def update
     @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
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
