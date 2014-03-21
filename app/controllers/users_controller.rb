class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @goals = @user.goals
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    render(:edit) && return unless @user.update_attributes(params[:user])
    redirect_to user_path
  end
end
