class DashboardController < ApplicationController

  def index
    render(:landing) && return unless logged_in?
    @friends = current_user.friend_goals
    @goals = current_user.incomplete_goals
  end

  def landing
  end
end