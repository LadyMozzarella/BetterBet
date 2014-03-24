require 'spec_helper'

describe GoalsController do
  let(:user) { create :user }
  let!(:goal) { create :goal }
  let(:goals) { create_list(:goal, 3) }
  let(:attribs) { attributes_for :goal }
  before(:each) { session[:user_id] = user.id }
  render_views

  context '#index' do
    it 'should be a success' do
      get :index
      expect(response).to be_success
    end
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

  context '#show' do
    it 'should be ok' do
      get :show, id: goal
      expect(response).to be_ok
    end

    it 'should assign goal to @goal' do
      get :show, id: goal
      expect(assigns(:goal)).to eq goal
    end
  end

  context '#edit' do
    it 'should be a success' do
      get :edit, id: goal
      expect(response).to be_success
    end

    it 'should assign @goal to new goal' do
      get :edit, id: goal
      expect(assigns(:goal)).to eq goal
    end
  end

  context '#update' do
    context 'with valid attributes' do
      it 'should redirect' do
        post :update, id: goal, goal: {title: "My title", description: "My desc", bet_amount: 50}
        expect(response).to be_redirect
      end
    end
    context 'with invalid attributes' do
      it 'should redirect' do
        post :update, id: goal, goal: {title: ""}
        expect(response).to be_redirect
      end
    end
  end

  context '#destroy' do
    it 'should be a redirect' do
      delete :destroy, id: goal
      expect(response).to be_redirect
    end
    it 'should delete a goal' do
      expect {
        delete :destroy, id: goal
      }.to change { Goal.count }.by(-1)
    end
  end
end