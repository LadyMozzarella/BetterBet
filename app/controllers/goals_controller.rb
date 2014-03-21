class GoalsController < ApplicationController
  before_filter :goal

  def goal
    @goal = Goal.find(params[:id])
  end

  def update
    @goal.update_attributes(params[:goal])
  end

  def destroy
    @goal.destroy
    redirect_to goals_path
  end

end