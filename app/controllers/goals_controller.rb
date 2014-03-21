class GoalsController < ApplicationController
  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
  end

end