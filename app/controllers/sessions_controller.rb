class SessionsController < ApplicationController
  def new
  	
  end

  def create
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to new_session_path
  end

  def destroy
    session.clear
  end
end