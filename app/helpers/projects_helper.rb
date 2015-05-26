module ProjectsHelper

  def  store_current_project(project)
      session[:project_id] = project.id 
  end

  def remove_current_project(id)
      forget(current_project)
      session.delete(:project_id)
      @current_project = nil
    end

  def current_project
      if (project_id = session[:project_id])
          @current_project ||= Project.find_by(id:project_id)
      elsif (project_id = cookies.signed[:project_id])
      raise
      project = Project.find_by(id:project_id)
      if  (project)
        store_current_project project_id
      else
          project = Project.new
      end
    end
  end

  def chosen_project?
    !current_project.nil?
  end

  def remember_project
    project.remember
    cookies.permanent.signed[:project_id] = project.id
  end

  def forget(project)
    project.forget
    cookies.delete(:project_id)
  end

end
