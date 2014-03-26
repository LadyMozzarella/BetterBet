class UsersController < ApplicationController
  before_filter :authorize, except: [:new, :create]
  before_filter :user, only: [:show, :edit, :update, :destroy, :goals]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    redirect_to new_user_path and return unless @user.save

    login(@user)
    UserMailer.welcome_email(@user).deliver

    customer = Customer.create(@user, params[:stripeToken])
    Payment.create(customer.id)
    @user.update_attribute(:stripe_id, customer.id)

    redirect_to dashboard_path
  end

  def autocomplete
    render :json => User.search(params[:name])
  end

  def show
    @image_url = @user.image
  end

  def edit
  end

  def update
    render(:edit) && return unless @user.update_attributes(params[:user])
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
    @user.destroy
    redirect_to login_path
  end

  private

  def user
    @user = User.find(params[:id])
  end

end
