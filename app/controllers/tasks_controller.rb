class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'Congratulations, new task created!'
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    if @task.update_attributes(task_params)
      flash[:success] = "Task was successfully updated."
    end
    redirect_to @task
  end

  def destroy
    @task.destroy
    flash[:success] = "Task was successfully destroyed."
    redirect_to tasks_url
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:id, :project_id, :name, :parent_id, :description, :created_by, :closed_by, :assignee, :created_at, :closed_at, :estimate, :task_state)
    end
end