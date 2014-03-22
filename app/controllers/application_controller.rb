class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  private

  def authorize
    unless logged_in?
      flash[:error] = "Please login to continue."
      redirect_to login_path
    end
  end
end
