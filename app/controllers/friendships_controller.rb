class FriendshipsController < ApplicationController
  def create
    binding.pry
    if current_user.friends << User.find(params[:format])
      flash[:notice] = "Added friend"
      redirect_to users_path
    else
      flash[:error] = "Error occured when adding friend."
      redirect_to users_path
    end
  end

  def destroy
    current_user.friends.delete(User.find(params[:id]))
    flash[:notice] = "successfully deleted friendship!"
    redirect_to users_path
  end
end