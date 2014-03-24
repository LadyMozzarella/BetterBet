require 'spec_helper'

describe Customer do
  let(:user) { create :user }
  before { StripeMock.start }
  after { StripeMock.stop }

  context '#create customer' do
    let(:token) { StripeMock.generate_card_token(last4: "4242", exp_year: 2014) }
    it 'should create a new customer' do
      expect{ Customer.create(user, token) }.to_not be_nil
    end
  end
end