require 'googlecharts'
require 'gchart'

module ProjectsHelper
  def pie_chart_for_tasks
    count = {}
    total = 0

    Task.where("project_id == ?", @project .id.to_s).each do |task|
        count[task.user] ||= 0
        count[task.user] += 1
        total += 1
    end
    data = count.collect { |user, number| number }
    labels = count.collect { |user, number| "#{user.fullName} (#{total == 0 ? 0 : (100.0 * number / total).round}%)" }

    Gchart.pie(:data => data, :labels => labels, :size => '550x300', :theme => :thirty7signals)
  end

def burndown_chart_of_project
    data = {}
    count = 0
    for i in 0..(@project.end_time.to_i - @project.start_time.to_i) / 3600
      data[i] = 0
      count += 1
    end

    total = 0
    project_start_time = @project.start_time
    Task.where("project_id == ?", @project .id.to_s).each do |task|
      if task.task_state == 0 || task.task_state == 1
        for i in 0..(count - 1)
          data[i] += 1
        end
        total += 1
      elsif task.task_state == 2 # done
        (task.closed_at.to_i - @project.start_time.to_i) / 3600
        for i in (@project.end_time.to_i - @project.start_time.to_i) / 3600..(count - 1)
          data[i] += 1
        end
        total += 1
      end
    end
    y = data.map {|key, value|  value   }
    y = y .reverse
    Gchart.line(:data => [y, [total, 0]], :axis_with_labels => ['x', 'y'], :axis_range => [[0, (@project.end_time.to_i - @project.start_time.to_i) / 3600 , 5], [0, total, 2]], :size => '550x300', :theme => :thirty7signals)
  end
end
