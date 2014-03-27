class FriendshipsController < ApplicationController
  before_filter :friend

  def create
    render(text: "Friend Added") && return if current_user.friends << @friend
    render(text: "Something went wrong. Please try again.", status: :unprocessable_entity)
  end

  def destroy
    render(text: "Friend Deleted") && return if current_user.friends.delete(@friend)
    render(text: "Something went wrong. Please try again.", status: :unprocessable_entity)
  end

  private

  def friend
    @friend = User.find(params[:friend_id])
  end
end