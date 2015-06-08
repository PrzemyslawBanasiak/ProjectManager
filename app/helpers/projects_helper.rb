require 'googlecharts'
require 'gchart'

module ProjectsHelper
  def pie_chart_for_tasks
    count = {}

    Task.where("project_id == ?", @project .id.to_s).each do |task|
        count[task.user] ||= 0
        count[task.user] += 1
    end

    total = count.count
    data = count.collect { |user, number| number }
    labels = count.collect { |user, number| "#{user.fullName} (#{total == 0 ? 0 : (100.0 * number / total).round}%)" }

    Gchart.pie(:data => data, :labels => labels, :size => '550x300', :theme => :thirty7signals)
  end

def burndown_chart_of_project
    count = {}
    total = 0
    Task.where("project_id == ?", @project .id.to_s).each do |task|
        count[task.task_state] ||= 0
        count[task.task_state] += 1
        total += 1
    end

    data = count.collect { |state, number| number }
    labels = count.collect { |state, number| "#{state} (#{total == 0 ? 0 : number })" }

    Gchart.line(:data => data, :labels => labels, :size => '550x300', :theme => :thirty7signals)
  end
end
