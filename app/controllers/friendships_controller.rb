class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice]="Added friend"
      redirect_to users_path
    else
      flash[:error]= "Error occured when adding friend."
      redirect_to users_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by_friend_id(params[:id])
    @friendship.destroy
    flash[:notice]="successfully deleted friendship!"
    redirect_to users_path
  end
end