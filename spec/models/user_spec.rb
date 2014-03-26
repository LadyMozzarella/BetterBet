require 'spec_helper'

describe User do
  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password_digest }
  end

  context "associations" do
    it { should have_many :friendships  }
    it { should have_many :goals }
  end

  context "#all_friends" do
    it "should return all friends"
  end

  context "#omniauth" do
    let!(:auth){ double(:auth, "provider" => "facebook",
    "uid" => 'facebook-user-id', 
    double(:info, 'name' => Faker::Lorem.word, 'email' => "email1@example.com", 
      'image' => "/assets/default_user_image.svg" ), 'credentials' => {'token' => '2dj2o2jda093', 'expires_at' => 1401036584} )} 
    
    it "should successfully save user with information" do 
      
      auth.stub(:slice){{"provider"=>"facebook", "uid"=>"16918390"}}
      # auth.stub(:info){{:name => Faker::Lorem.word, :email => "email1@example.com", 
      # :image => "/assets/default_user_image.svg"}}
      expect(User.omniauth(auth)).to change{ User.count }.by 1
    end
  end

  context "#has_friends?" do
    context "if user has friends" do
      it "should return true"
    end

    context "if user doesn't have friends" do
      it "should return false"
    end
  end

  context "#latest_goal" do
    it "should grab the latest goal"
  end

  context "#is_user?" do
    context "if user is itself" do
      it "should return true"
    end

    context "if user isn't itself" do
      it "should return false"
    end
  end

  context "#search" do
    context 'with matching string' do
      it 'should return the user\'s name'
    end

    context 'with no matching string' do
      it 'should return an empty array'
    end
  end

  context "#friend_goals" do
    it "should return a crazy hash"
  end

  context "#has_friend?" do
    context "if user has friends" do
      it "should return true"
    end

    context "if user doesn't have friend" do
      it "should return false"
    end
  end

  context "#active_goals" do
    it "should return a sorted list of goals"
  end

  context "#image=" do
    context "gravatar image" do
      it "should assign the gravatar path"
    end

    context "facebook image" do
      it "should keep the facebook image"
    end

    context "no default image" do
      it "should assign the default image path"
    end
  end

  context "#generate_md5" do
    it "should generate a hashed string from a user's email"
  end

  context "#get_buddies" do
    it "should return a user's friends that have a Stripe recipient id"
  end

  context "#incomplete_goals" do
    it "should return an array of incomplete goals"
  end
end