class GoalsController < ActionController::Base

  def new
    @goal = Goal.new
  end

  def create
    @user = current_user
    @goal = @user.goals.new(params[:goal])
    if @goal.save
      redirect_to '/'
    else
      flash[:error] = "Invalid goal"
      redirect to '/'
  end
end