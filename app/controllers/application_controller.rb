class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_filter :require_login
  layout :layout_by_resource


  protected
  def layout_by_resource
    if  request.env['PATH_INFO'] == '/login' || request.env['PATH_INFO'] == '/signup' || (request.method == "POST" && request.env['PATH_INFO'] == '/users' )
      "application"
    else
      "admin"
    end
  end

  def require_login
    unless current_user
      redirect_to '/login'
    end
  end
end