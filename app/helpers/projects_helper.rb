module ProjectsHelper
  def pie_chart_for_tasks
    count = {}
    total = 0
    Task.all.each do |task|
      if  task.project_id == @project .id
        count[task.user] ||= 0
        count[task.user] += 1
        total += 1
      end
    end

    data = count.collect { |user, number| number }
    labels = count.collect { |user, number| "#{user.fullName} (#{total == 0 ? 0 : (100.0 * number / total).round}%)" }

    Gchart.pie(:data => data, :labels => labels, :size => '550x300', :theme => :thirty7signals)
  end

end
