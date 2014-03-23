class FriendshipsController < ApplicationController
  before_filter :friend

  def create
    current_user.friends << @friend
    UserMailer.new_friend(current_user, User.find(params[:friend_id])).deliver
    render :nothing => true, :status => 200
  end

  def destroy
    current_user.friends.delete(@friend)
    render :nothing => true, :status => 200
  end

  private

  def friend
    @friend = User.find(params[:friend_id])
  end
end