require 'spec_helper'

describe "User" do
  let!(:user) { create :user }
  let(:new_user) { create :user }

  describe "can create an account" do
    it "by visiting the new user page" do
      visit new_user_path
      fill_in 'Name', :with => new_user.name
      fill_in 'Email', :with => new_user.email
      fill_in 'Password', :with => new_user.password
      fill_in 'Password confirmation', :with => new_user.password
      fill_in 'Card Number', :with => "424242424242"
      fill_in 'Expiration (MM/YYYY)', :with => "09"
      fill_in '/', :with => "1016"
      fill_in 'CVC', :with => "898"
      click_button 'Create User'
      expect(page).to have_content 'Ongoing Goalsgit '
    end
  end

  describe "signed in" do
    describe "can log in" do
      # visit logout_path
      # fill_in 'Email', :with => user.email
      # fill_in 'Password', :with => user.password
      # click_button 'Login'
    end

    describe "can view all users" do
      it "by visiting the users index page" do
        visit users_path
      end
    end

    describe "can edit their own account" do
      it "by visiting their own user edit page"
    end

    describe "can view a user's profile" do
      it "by viewing the user show page"
    end
  end
end