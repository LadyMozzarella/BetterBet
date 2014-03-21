require 'spec_helper'

describe GoalsController do
  let(:goal) { create :goal }
  let(:goals) { create_list(:goal, 3) }

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
end