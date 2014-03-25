class DashboardController < ApplicationController
  before_filter :authorize

  def index
    @friends = current_user.friend_goals
    @goal = current_user.latest_goal
  end
end