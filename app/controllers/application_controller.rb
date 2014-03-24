class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery

  private

  def authorize
    unless logged_in?
      redirect_to login_path
    end
  end
end
