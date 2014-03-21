class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @goals = @user.goals
  end
end
