class UsersController < ApplicationController
  before_filter :authorize, except: [:new, :create]
  before_filter :load_user, only: [:show, :edit, :update, :destroy, :goals]

  def index
    @users = User.all - [current_user]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      customer = Customer.create(@user, params[:stripeToken])
      Payment.create(customer.id)
      @user.update_attribute(:stripe_id, customer.id)
      login(@user)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def autocomplete
    render :json => User.search(params[:name])
  end

  def show
    @is_user = ( @user.id == current_user.id )
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

  def load_user
    @user = User.find(params[:id])
  end

end
