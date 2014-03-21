class SessionsController < ApplicationController
  def new

  end

  def facebook_signup
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to new_session_path
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end