module ApplicationHelper

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end

  def logged_in?
    !!session[:id]
  end

end
