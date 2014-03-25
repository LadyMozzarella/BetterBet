require 'spec_helper'

describe DashboardController do
  let!(:goal) { create :goal }
  before(:each) { session[:user_id] = goal.owner_id }

  context '#index' do
    it "should be okay" do
      get :index
      expect(response).to be_ok
    end

    it "should assign the user's latest_goal to @goal" do
      get :index
      expect(assigns :goal).to eq [goal]
    end
  end
end