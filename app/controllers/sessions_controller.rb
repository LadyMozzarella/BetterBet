class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path if logged_in?
  end

  def facebook_signup
    user = User.omniauth(env['omniauth.auth'])
    login(user)
    redirect_to dashboard_path
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect_to login_path
  end
end