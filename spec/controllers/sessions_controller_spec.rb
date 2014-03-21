require 'spec_helper'

describe SessionsController do
  let!(:user) { :user }

  describe "#new" do
    it "should be successful" do
      get :new
      expect(response).to be_ok
    end
  end

  describe "#destroy" do
    it "should clear a session" do
      session[:user_id] = 1
      expect(session[:user_id]).to_not be_nil
      post :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end