class PagesController < ApplicationController

  def stylemaster
  end

  def dashboard
    @goal = current_user.latest_goal
  end

end