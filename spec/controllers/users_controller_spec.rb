require 'spec_helper'

describe UsersController do
  let(:user) { create :user }
  let(:attribs) { attributes_for :user }
  render_views

  context '#show' do
    before(:each) { session[:user_id] = user.id }

    it 'should be a success' do
      get :show, id: user.id
      expect(response).to be_success
    end

    it 'should find a specific user' do
      get :show, id: user.id
      expect(assigns(:user)).to eq user
    end

    it 'should find goals for a specific user' do
       get :show, id: user.id
       expect(assigns(:goals)).to eq user.goals
    end
  end

  context '#edit' do
    before(:each) { session[:user_id] = user.id }

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
    before(:each) { session[:user_id] = user.id }

    context 'valid attributes' do
      it "should update a user's information" do
        expect {
            put :update, :id => user.id, :user => { :bio => "New Bio"}
          }.to change{ user.reload.bio }.to ("New Bio")
      end
    end

    context 'invalid attributes' do
      it "shouldn't update a user's information" do
        expect {
            put :update, :id => user.id, :user => { :name => ""}
          }.to_not change{ user.reload.name }.to ("")
      end
    end
  end

  context '#new' do
    it 'should be a success' do
      get :new
      expect(response).to be_success
    end

    it 'should assign @user to new user' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  context '#create' do

    context 'with valid attributes' do
      it 'should be redirect' do
        post :create, user: attribs
        expect(response).to be_redirect
      end
    end

    context 'with invalid attributes' do
      it 'should be redirect' do
        post :create
        expect(response).to be_redirect
      end
    end

    context 'with valid attributes' do
      it 'should increase User count by one' do
        expect {
          post :create, user: attribs
        }.to change{ User.count }.by(1)
      end
    end

    context 'with invalid attributes' do
      it 'should not increase User count' do
        expect {
          post :create, :user => {email: ''}
        }.to_not change{ User.count }
      end
    end
  end

  context "#destroy" do
    before(:each) { session[:user_id] = user.id }

    it 'should be redirect' do
      delete :destroy, id: user
      expect(response).to be_redirect
    end

    it 'should decrease User count by one' do
      expect {
        delete :destroy, id: user
        }.to change { User.count }.by(-1)
    end
  end
end