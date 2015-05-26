class ProjectsController < ApplicationController
  skip_before_filter :require_login

  def show
    #@projectas = Project.all
    @project = Project.find(params[:id])
    @readOnly = @project != current_project
  end

  def choose
   @projectas = Project.all
    #@project = Project.find(params[:id])
    #@readOnly = @project != current_project
  end

  def new
   # if current_project
   #   redirect_to '/projects/show.html'
   # end
      #redirect_to '/projects/new'
      @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      store_current_project  @project
      flash[:success] = 'Congratulations, new project created!'
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid sth sth'
      render  '/'
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project != current_project
      flash[:alert] = "Cant edit current project, temporarily ^^"
    else
      if @project.update_attributes(project_params)
        flash[:success] = "Project updated"
      end
    end
    redirect_to @project
  end

  private

  def project_params
    params.require(:project).permit(:name, :start_time, :end_time,
                                 :description)
  end
end



