class RecipientsController < ApplicationController
  skip_filter :verify_authenticity_token, only: :create
  before_filter :authorize

  def new
  end

  def create
    recipient = Stripe::Recipient.create(
      :name => params[:full_name],
      :type => "individual",
      :bank_account => params[:stripeToken]
      )

    if current_user.update_attributes(recipient_id: recipient.id)
      flash[:notice] = "Bank account information saved"
      redirect_to root_path
    else
      flash[:error] = "Try again please"
      render :new
    end
  end
end