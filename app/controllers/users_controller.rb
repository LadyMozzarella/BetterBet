class UsersController < ApplicationController
  before_filter :authorize, except: [:new, :create]
  def index
    @users= User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    render(:new) && return unless @user.save

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

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
    redirect_to user_path(@user)
  end
end
