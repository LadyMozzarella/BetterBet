require 'spec_helper'

describe Payment do
  let(:user) { create :user }
  before { StripeMock.start }
  after { StripeMock.stop }

  context '#charge' do
    it 'should create a new charge' do
      expect{ Payment.create(user.stripe_id) }.to_not be_nil
    end
  end
end