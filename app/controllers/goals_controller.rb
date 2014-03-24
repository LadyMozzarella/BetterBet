class GoalsController < ApplicationController
  before_filter :goal, except: [:new, :create, :goal, :index, :status]
  before_filter :authorize

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def show
  end

  def create
    user = current_user
    goal = user.goals.new(params[:goal])
    if goal.save
      redirect_to goal_path(goal)
    else
      flash[:error] = "Invalid goal"
      redirect_to new_goal_path
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
    if request.xhr?
      render :nothing => true, :status => 200
    else
      redirect_to goals_path
    end
  end


  def complete
    @goal.toggle!(:completed)
    redirect_to goal_path(@goal)
  end

  def status
    render :nothing => true, :status => 200, json: current_user.goals
  end

  private

  def goal
    @goal = Goal.find(params[:id])
  end
end