class DashboardController < ApplicationController
  before_filter :authorize

  def index
    @friends = current_user.friend_goals
    @goals = current_user.active_goals
    p current_user
    p current_user.friend_goals
  end
end