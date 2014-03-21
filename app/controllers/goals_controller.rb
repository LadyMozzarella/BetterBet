class GoalsController < ActionController::Base
  include ApplicationHelper

  def new
    @goal = Goal.new
  end

  def create
    user = current_user
    goal = user.goals.new(params[:goal])
    if goal.save
      redirect_to '/'
    else
      flash[:error] = "Invalid goal"
      redirect_to '/'
    end
  end
end