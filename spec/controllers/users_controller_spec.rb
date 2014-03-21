require 'spec_helper'

describe UsersController do
  let(:user) { create :user }
  let(:goals) { create_list(:goal, 3) }
  context '#show' do
    it 'should be a success' do
      get :show, id: user.id
      expect(response).to be_success
    end

    it 'should assign @user to user' do
      get :show, id: user.id
      expect(assigns(:user)).to eq user
    end

    it 'should assign @goals to goal' do
      get :show, id: user.id
      expect(assigns(:goals)).to eq user.goals
    end
  end
end