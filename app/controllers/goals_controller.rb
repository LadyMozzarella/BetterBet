class GoalsController < ApplicationController
  before_filter :goal, except: [:new, :create, :goal, :status, :buddy_status]
  before_filter :authorize

  def new
    @goal = Goal.new
  end

  def create
    user = current_user
    goal = user.goals.new(params[:goal])
    if goal.save
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid goal"
      redirect_to new_goal_path
    end
  end

  def edit
  end

  def update
    @goal.update_attributes(params[:goal])
    redirect_to dashboard_path
  end

  def destroy
    @goal.destroy
    if request.xhr?
      render :nothing => true, :status => 200
    else
      redirect_to dashboard_path
    end
  end

  def complete
    @goal.update_attributes(completed: true, terminated_at: Time.now)
    redirect_to dashboard_path
  end

  def status
    goals = Goal.expired_goal_by_user(current_user)
    render json: goals.to_json
  end

  def terminate
    @goal.update_attributes(completed: params[:complete], terminated_at: Time.now)
    render :nothing => true, :status => 200
  end

  def buddy_status
    goal = Goal.expired_goal_by_buddy(current_user)[0]
    render json: {goal: goal, friend: goal.owner.name}.to_json
  end

  def confirm
    @goal.update_attribute(status_confirmed: params[:complete])
    render :nothing => true, :status => 200
  end

  private

  def goal
    @goal = Goal.find(params[:id])
  end
end