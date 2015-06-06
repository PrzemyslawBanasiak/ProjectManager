class ProjectsController < ApplicationController
  skip_before_filter :require_login

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def new
      @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Congratulations, new project created!'
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
    end
    redirect_to @project
  end

  def destroy
    Project.delete(params[:id])
    redirect_to :action => 'index'
    flash[:success] = "Project deleted"
  end

  private

  def project_params
    params.require(:project).permit(:name, :start_time, :end_time,
                                 :description)
  end
end



