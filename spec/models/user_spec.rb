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

  context "#omniauth" do
    it "should successfully save user with information"
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
<<<<<<< HEAD
=======
  end

  context "#is_user?" do
    context "if user is itself" do
      it "should return true" do
        expect(user.is_user?(user)).to eq true
      end
    end

    context "if user isn't itself" do
      let(:imposter) { create :user }
      it "should return false" do
        expect(imposter.is_user?(user)).to eq false
      end
    end
>>>>>>> dd498811d0a89415899c28a9ce50d1f1b7515b77
  end

  context "#search" do
    context 'with matching string' do
      it 'should return the user\'s name' do

      end
    end

    context 'with no matching string' do
      it 'should return an empty array'
    end
  end

  context "#friend_goals" do
    let(:friends) { create_list(:user, 1) }
    let(:goals) { create_list(:goal, 2) }
    xit "should return a goals for a user's friend" do
      friend = friends.first
      friend.stub(:goals) { goals }
      user.stub(:friends) { friends }
      expect(user.friend_goals).to eq friend.goals
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

<<<<<<< HEAD
=======
  context "#active_goals" do
    let(:recent_goal) { create :goal, :recent }
    let(:past_goal) { create :goal }
    xit "should return a sorted list of goals" do
      user.stub(:goals) { [recent_goal, past_goal] }
      expect(user.active_goals).to eq goals
      expect(user.active_goals.first).to eq recent_goal
    end
  end

>>>>>>> dd498811d0a89415899c28a9ce50d1f1b7515b77
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

<<<<<<< HEAD
=======
  context "#incomplete_goals" do
    let(:incomplete_goals) { create_list(:goal, 2, :incomplete) }
    it "should return an array of incomplete goals" do
      user.stub(:goals) { incomplete_goals }
      expect(user.incomplete_goals).to eq incomplete_goals
    end
  end
>>>>>>> dd498811d0a89415899c28a9ce50d1f1b7515b77
end