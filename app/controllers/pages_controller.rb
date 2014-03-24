class PagesController < ApplicationController
  before_filter :authorize

  # move this to a separate controller
  def dashboard
    @friends = current_user.friend_goals
    @goal = current_user.latest_goal
  end

end
