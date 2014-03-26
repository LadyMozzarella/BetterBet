class FriendshipsController < ApplicationController
  before_filter :friend

  def create
    if current_user.friends << @friend
      render :text => "You are now friends with #{@friend.name}"
    else
      render :text => "Something went wrong, please try again", :status => :unprocessable_entity
    end
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