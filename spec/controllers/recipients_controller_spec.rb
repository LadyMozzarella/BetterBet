require 'spec_helper'

describe RecipientsController do
  let!(:user) { create :user }
  before(:each) { session[:user_id] = user.id }
  let(:token) { StripeMock.generate_bank_token(country: 'US', account_number: '000123456789', routing_number: '110000000') }
  before { StripeMock.start }
  after { StripeMock.stop }

  context '#new' do
    it 'should be a success' do
      get :new
      expect(response).to be_ok
    end
  end

  context '#create' do
    context 'with valid attributes' do
      it 'should assign bank account to user\'s recipient_id' do
        post :create, :full_name => "Joe Schmo", :stripeToken => token
        expect(user.reload.recipient_id).to_not be_nil
      end
      it 'should redirect' do
        post :create, :full_name => "Joe Schmo", :stripeToken => token
        expect(response).to be_redirect
      end
    end

  end
end