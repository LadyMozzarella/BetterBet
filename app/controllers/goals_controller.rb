class GoalsController < ApplicationController
  before_filter :goal

  def goal
    @goal = Goal.find(params[:id])
  end

  def update
  end

  def destroy
    @goal.destroy
    redirect_to goals_path
  end

end