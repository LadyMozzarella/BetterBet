require 'spec_helper'

describe "User", js: true do
  let!(:user) { create :user }
  let!(:friend) { create :user }
  let(:new_user) { create :user }

  describe "sign up or log in" do
    describe "can create an account" do
      it "by visiting the new user page" do
        visit new_user_path
        fill_in 'Name', with: new_user.name
        fill_in 'Email', with: 'me@example.com'
        fill_in 'Password', with: '123'
        fill_in 'Password confirmation', with: '123'
        fill_in 'Bio', with: new_user.bio
        fill_in 'Card Number', with: "4242424242424242"
        fill_in 'Expiration (MM/YYYY)', with: "09"
        fill_in '/', with: "2016"
        fill_in 'CVC', with: "898"
        click_button 'Create User'
        expect(page).to have_content 'Ongoing Goals'
      end
    end

    describe "can log in" do
      it "can log in" do
        visit logout_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Login'
        expect(page).to have_content 'Friends Timeline'
      end
    end
  end

  describe "signed in" do
    before(:each) do
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end

    describe "can add a friend" do
      it "by visiting the users index page" do
        visit user_path friend
        find(:css, 'img[src*="plus.svg"]').click
        expect(page).to have_content 'Added friend'
      end
    end

    describe "can edit their own account" do
      it "by visiting their own user edit page" do
        visit edit_user_path user
        fill_in 'Name', with: 'New Name'
        click_button 'Submit'
        expect(page).to have_content 'New Name'
      end
    end

    describe "can view a user's profile" do
      it "by viewing the user show page" do
        visit user_path friend
        expect(page).to have_content friend.name
      end
    end
  end
end