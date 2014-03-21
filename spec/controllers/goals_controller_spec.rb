require 'spec_helper'

describe GoalsController do
  let(:goal) { create :goal }
  let(:goals) { create_list(:goal, 3) }
  let(:attribs) { attributes_for :goal }
  let(:user) { create :user }
  before(:each) do
    session[:user_id] = user.id
  end

  context '#new' do
    it 'should be a success' do
      get :new
      expect(response).to be_success
    end

    it 'should assign @goal to new goal' do
      get :new
      expect(assigns(:goal)).to be_a_new Goal
    end
  end

  context '#create' do
    context 'with valid attributes' do
      it 'should be redirect' do
        post :create, goal: attribs
        expect(response).to be_redirect
      end
    end

    context 'with invalid attributes' do
      it 'should be redirect' do
        post :create, goal: {title: 'invalid goal'}
        expect(response).to be_redirect
      end
    end
  end
end