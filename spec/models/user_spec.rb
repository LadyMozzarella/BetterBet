require 'spec_helper'

describe User do
  let!(:user) { create :user }
  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password_digest }
  end

  context "associations" do
    it { should have_many :friendships  }
    it { should have_many :goals }
  end

  context "#has_friends?" do
    context "if user has friends" do
      let(:friend) { create :user }
      it "should return true" do
        user.friends << friend
        expect(user.has_friends?).to eq true
      end
    end

    context "if user doesn't have friends" do
      it "should return false" do
        expect(user.has_friends?).to eq false
      end
    end
  end

  context "#latest_goal" do
    it "calls latest_for on the Goal" do
      expect(Goal).to receive(:latest_for).with(user) {[]}
      user.latest_goal
    end
  end

  context "#has_friend?" do
    context "if user has friends" do
      it "should return true" do
        user.stub(:friends) { [ double(:friend) ] }
        expect(user.has_friends?).to eq true
      end
    end

    context "if user doesn't have friend" do
      it "should return false" do
        expect(user.has_friends?).to eq false
      end
    end
  end

  context "#image=" do
    context "gravatar image" do
      let(:user_gravatar) { create :user, :img_gravatar }
      it "should assign the gravatar path" do
        expect(user_gravatar.image).to include("http://www.gravatar.com/avatar")
      end
    end

    context "facebook image" do
      let(:user_facebook) { create :user, :img_fb }
      it "should keep the facebook image" do
        expect(user_facebook.image).to include("http://graph.facebook.com")
      end
    end

    context "default image" do
      let(:user_default) { create :user, :img_default }
      it "should assign the default image path" do
        expect(user_default.image).to include("/assets/default_user_image.svg")
      end
    end
  end

  context "#generate_md5" do
    it "should generate a hashed string" do
      expect(user.generate_md5).to be_instance_of(String)
    end
  end

  context "#get_buddies" do
    let(:stripe_users) { create_list(:user, 2, :stripe_recipient) }
    it "should return a user's friends that have a Stripe recipient id" do
      user.stub(:friends) { stripe_users }
      expect(user.get_buddies).to eq stripe_users
    end
  end
end
