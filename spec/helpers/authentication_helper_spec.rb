require 'spec_helper'

describe AuthenticationHelper do
  let!(:user) { create :user }
  context '#current_user' do
    context 'when there is a user' do
      it 'should return the current user' do
        session[:user_id] = user.id
        expect(helper.current_user).to eq user
      end
    end

    context 'when there is no user' do
      it 'should return nil' do
        expect(helper.current_user).to eq nil
      end
    end
  end

  context '#logged_in?' do
    context 'when there is a user' do
      it 'should return true' do
        session[:user_id] = user.id
        expect(helper.logged_in?).to eq true
      end
    end

    context 'when there is no user' do
      it 'should return false' do
        expect(helper.logged_in?).to eq false
      end
    end
  end
end
