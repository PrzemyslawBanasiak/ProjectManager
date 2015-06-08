class WorkLoggerController < ApplicationController
  def new
    @workLog = WorkLog.new()
    @task = Task.find(params[:id])
  end

  def create
    @workLog = WorkLog.new(workLog_params)
    @workLog.user = current_user

    if @workLog.save
      flash[:success] = 'Time logged!'
      redirect_to @workLog.task.project
    else
      render 'new'
    end
  end

  def workLog_params
    params.require(:work_log).permit(:id, :task_id, :user_id, :value, :comment, :created_at)
  end
end
