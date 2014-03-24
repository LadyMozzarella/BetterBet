class PagesController < ApplicationController
  before_filter :authorize

  def stylemaster
  end

  def dashboard
    @friends = current_user.friend_goals
    @goal = current_user.latest_goal
  end

end