class UsersController < ApplicationController
  before_filter :authorize, except: [:new, :create]
  before_filter :user, only: [:show, :edit, :update, :destroy, :goals]

  def index
    # find a clean way to remove the current_user from the list of users.
    @users = User.all.reject {|user| user == current_user}
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      # move this to an after create in the user model (lines 18-21)
      UserMailer.welcome_email(@user).deliver
      # move this to an before create in the user model (lines 19-21)
      customer = Customer.create(@user, params[:stripeToken])
      Payment.create(customer.id)
      @user.update_attribute(:stripe_id, customer.id)

      redirect_to dashboard_path
    else
      render :new
    end
  end

  # jquery ui..you suck
  def autocomplete
    render :json => User.search(params[:name])
  end

  def show
    @image_url = @user.get_image_url
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

  # looks like legacy code!
  def search
    user = User.find_by_name(params[:user])
    render :json => user
  end

  def goals
    @goals = @user.goals
  end

  private

  def user
    @user = User.find(params[:id])
  end

end
