require 'spec_helper'

describe FriendshipsController do
  let(:user) { create :user }
  let(:friend) { create :user }

  context '#create' do
    before(:each) { session[:user_id] = user.id }

    it 'should create a friendship' do
      expect {
        get :create, friend_id: friend
      }.to change{ Friendship.count }.by 1
    end

    it 'should not redirect' do
      get :create, friend_id: friend
      expect(response).to_not be_redirect
    end
  end

  context '#destroy' do
    let!(:friendship) { create :friendship }
    before(:each) { session[:user_id] = friendship.user_id }

    it 'should destroy a friendship' do
      expect {
        delete :destroy, friend_id: friendship.friend, id: friendship
      }.to change{ Friendship.count }.by -1
    end

    it 'should not redirect' do
      delete :destroy, friend_id: friendship.friend, id: friendship
      expect(response).to_not be_redirect
    end
  end
end