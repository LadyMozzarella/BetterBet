require 'spec_helper'

describe SessionsController do
  let!(:user) { create :user }

  describe "#new" do
    it "should be successful" do
      get :new
      expect(response).to be_ok
    end
  end

  describe "#destroy" do
    it "should clear a session" do
      session[:user_id] = user.id
      post :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end