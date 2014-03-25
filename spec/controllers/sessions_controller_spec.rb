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
    it "should clear a session" do
      session[:user_id] = user.id
      post :destroy
      expect(session[:user_id]).to be_nil
    end
  end

  context "#create" do
    it "should create a session" do
      post :create, email: user.email, password: user.password
      expect(session[:user_id]).to eq user.id
    end
  end
end