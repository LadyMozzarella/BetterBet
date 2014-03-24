require "spec_helper"

describe UserMailer do
  let!(:user) { create :user }
  let(:mail) { UserMailer.welcome_email(user)}
  let(:app_mail) {'betterbetapp@gmail.com'}

  context 'sending an email' do
    before(:each) { mail.deliver! }
    it 'should increase the storage count by one' do
      expect(ActionMailer::Base.deliveries.last.to.first).to eq(user.email)
    end

    it 'should contain the apps email address' do
      expect(mail.from.first).to eq(app_mail)
    end

    it 'should contain the user\'s email' do
      expect(mail.to.first).to eq(user.email)
    end
  end
end
