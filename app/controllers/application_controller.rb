class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  private

  def authorize
    redirect_to login_path unless logged_in?
  end
end
