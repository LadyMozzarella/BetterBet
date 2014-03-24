class PagesController < ApplicationController
  before_filter :authorize

  def stylemaster
  end

  def dashboard
    @friends = current_user.friends
    @goal = current_user.latest_goal
  end

end