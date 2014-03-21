require 'spec_helper'

describe GoalsController do
  let!(:goal) { create :goal }
  let(:update_goal) { double("goal", title: "My title", description: "My desc", bet_amount: 50) }
  let(:goals) { create_list(:goal, 3) }
  let(:attribs) { attributes_for :goal }

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

  context '#update' do
    context 'with valid attributes' do
      it 'should redirect' do
        post :update, id: goal: update_goal
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