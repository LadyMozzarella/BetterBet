class FriendshipsController < ApplicationController
  before_filter :friend

  def create
    if current_user.friends << @friend
      render :text => "Friend Added"
    else
      render :text => "Something went wrong. Please try again.", :status => :unprocessable_entity
    end
  end

  def destroy
    if current_user.friends.delete(@friend)
      render :text => "Friend Deleted"
    else
      render :text => "Something went wrong. Please try again.", :status => :unprocessable_entity
    end
  end

  private

  def friend
    @friend = User.find(params[:friend_id])
  end
end