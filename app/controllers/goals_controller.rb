class GoalsController < ApplicationController
  before_filter :goal

  def goal
    @goal = Goal.find(params[:id])
  end

  def destroy
    @goal.destroy
  end

end