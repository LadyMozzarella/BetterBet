class GoalsController < ApplicationController
  include ApplicationHelper
  before_filter :goal, only: [:edit, :update, :destroy]

  def goal
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def show
    @goal = Goal.find(params[:id])
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

  def edit
  end

  def update
    @goal.update_attributes(params[:goal])
    redirect_to goal_path(@goal)
  end

  def destroy
    @goal.destroy
    redirect_to goals_path
  end
end