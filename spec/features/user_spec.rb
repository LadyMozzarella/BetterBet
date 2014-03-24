require 'spec_helper'

describe "User", :js => true do
  let(:user) { create :user }

  describe "can view all users" do
    it "by visiting the users index page"
  end

  describe "can create an account" do
    it "by visiting the new user page"
  end

  describe "can edit their own account" do
    it "by visiting their own user edit page"
  end

  describe "can view a user's profile" do
    it "by viewing the user show page"
  end
end