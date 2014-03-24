class FriendshipsController < ApplicationController
  before_filter :load_friend #personal preference

  def create
    # handle the unhappy path, even with a generic message: "sorry something went wrong, please try again"
    current_user.friends << @friend
    # move this to a after_create in model
    UserMailer.new_friend(current_user, User.find(params[:friend_id])).deliver
    render :nothing => true, :status => :ok
  end

  def destroy
    current_user.unfriend(@friend)
    render :nothing => true, :status => :ok
  end

  private

  def load_friend
    @friend = User.find(params[:friend_id])
  end
end
