require 'spec_helper'

describe SessionsController do
  let!(:user) { create :user }

  context "#new" do
    it "should be successful" do
      get :new
      expect(response).to be_ok
    end
  end

  context "#destroy" do
    before(:each) { session[:user_id] = user.id }
    it "should clear a session" do
      post :destroy
      expect(session[:user_id]).to be_nil
    end

    it "should redirect" do
      post :destroy
      expect(response).to be_redirect
    end
  end

  context "#create" do
    context 'with valid attributes' do
      it "should create a session" do
        post :create, email: user.email, password: user.password
        expect(session[:user_id]).to eq user.id
      end
    end

    context 'with invalid attributes' do
      it "shouldn't create a session" do
        post :create, email: user.email, password: ""
        expect(session[:user_id]).to eq nil
      end
    end
  end

  context "#facebook_signup" do
    it 'should redirect the user after login' do
      User.stub(:omniauth){ user }
      get :facebook_signup , provider: 'facebook'
      expect(response).to be_redirect
    end
  end

end