require 'spec_helper'

describe UsersController do
  let(:user) { create :user }
  let(:attribs) { attributes_for :user }
  let!(:goal) { create :goal }
  let(:users) {create_list :user, 2}
  render_views

  context '#new' do
    it 'should be a success' do
      get :new
      expect(response).to be_success
    end

    it 'should assign @user to new user' do
      get :new
      expect(assigns :user).to be_a_new User
    end
  end

  context '#create' do
    let(:token) { StripeMock.generate_card_token(last4: "4242", exp_year: 2014) }
    before { StripeMock.start }
    after { StripeMock.stop }

    context 'with valid attributes' do
      it 'should be redirect' do
        post :create, user: attribs, stripeToken: token
        expect(response).to be_redirect
      end
    end

    context 'with invalid attributes' do
      it 'should be redirect' do
        post :create
        expect(response).to be_redirect
      end
    end

    context 'with valid attributes' do
      it 'should increase User count by one' do
        expect {
          post :create, user: attribs, stripeToken: token
        }.to change{ User.count }.by 1
      end
    end

    context 'with invalid attributes' do
      it 'should not increase User count' do
        expect {
          post :create, :user => {email: ''}, stripeToken: token
        }.to_not change{ User.count }
      end
    end
  end

  context "logged in" do
    before(:each) { session[:user_id] = user.id }

    context '#autocomplete' do
      it 'should return a json object' do
        User.stub(:search){ users }
        get :autocomplete
        expect(response.body).to eq users.to_json
      end
    end

    context '#index' do
      it 'should be a success' do
        get :index
        expect(response).to be_ok
      end

      it 'should assign all users to @user' do
        get :index
        expect(assigns :users).to eq User.all
      end
    end

    context '#show' do
      it 'should be a success' do
        get :show, id: user
        expect(response).to be_success
      end

      it 'should find a specific user' do
        get :show, id: user
        expect(assigns :user).to eq user
      end

      it 'should assign a user\'s image path to @image_url' do
        get :show, id: user
        expect(assigns :image_url).to_not eq nil
      end
    end

    context '#edit' do
      it 'should be a success' do
        get :edit, id: user
        expect(response).to be_success
      end

      it 'should have a form' do
        get :edit, id: user
        expect(response.body).to include 'form'
      end
    end

    context '#update' do
      context 'valid attributes' do
        it "should update a user's information" do
          expect {
              put :update, id: user, user: { bio: "New Bio" }
            }.to change{ user.reload.bio }.to "New Bio"
        end
      end

      context 'invalid attributes' do
        it "shouldn't update a user's information" do
          expect {
              put :update, id: user, user: { name: "" }
            }.to_not change{ user.reload.name }.to ""
        end
      end
    end

    context "#destroy" do
      it 'should be redirect' do
        delete :destroy, id: user
        expect(response).to be_redirect
      end

      it 'should decrease User count by one' do
        expect {
          delete :destroy, id: user
          }.to change{ User.count }.by -1
      end
    end
  end
end