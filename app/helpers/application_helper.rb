module ApplicationHelper

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def format_days(seconds)
    mins, secs = seconds.divmod(60)
    hours, mins = mins.divmod(60)
    days, hours = hours.divmod(24)
    days
  end

  def format_date(timestamp)
    timestamp.strftime('%B %d, %Y')
  end
end
