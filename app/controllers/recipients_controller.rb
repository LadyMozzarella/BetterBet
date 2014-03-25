class RecipientsController < ApplicationController
  skip_filter :verify_authenticity_token, only: :create

  def new
  end

  def create
    recipient = Stripe::Recipient.new(
      :name => params[:full_name],
      :type => "individual",
      :bank_account => params[:stripeToken]
      )

    if recipient.save && current_user.update_attributes(recipient_id: params[:stripeToken])
      flash[:notice] = "Bank account information saved"
      redirect_to root_path
    else
      flash[:error] = "Bank account information not saved"
      render :new
    end
  end
end