class ApplicationController < ActionController::Base
  include AuthenticationHelper
  protect_from_forgery

  helper_method :current_user, :logged_in?

  private

  def authorize
    redirect_to login_path unless logged_in?
  end
end
