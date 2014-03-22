class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  private

  def authorized
    redirect_to login_path unless logged_in?
  end
end
