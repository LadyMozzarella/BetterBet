class FriendshipsController < ApplicationController
  def create
    if current_user.friends << User.find(params[:format])
      UserMailer.new_friend(current_user, User.find(params[:format])).deliver
      flash[:notice] = "Added friend"
      redirect_to users_path
    else
      flash[:error] = "Error occured when adding friend."
      redirect_to users_path
    end
  end

  def destroy
    current_user.friends.delete(User.find(params[:id]))
    flash[:notice] = "Removed friend"
    redirect_to users_path
  end
end