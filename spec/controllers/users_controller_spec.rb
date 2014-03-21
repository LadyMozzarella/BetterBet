require 'spec_helper'

describe UsersController do
  let(:user) { create :user }
  let(:goals) { create_list(:goal, 3) }
  render_views

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

  context '#edit' do
    it 'should be a success' do
      get :edit, id: user.id
      expect(response).to be_success
    end

    it 'should have a form' do
      get :edit, id: user.id
      expect(response.body).to include('form')
    end
  end

  context '#update' do
    it 'should update a user\'s information' do
      expect {
          put :update, :id => user.id, :user => { :bio => "New Bio"}
        }.to change{ user.reload.bio }.to ("New Bio")
    end
  end
end