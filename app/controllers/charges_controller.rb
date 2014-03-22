class ChargesController < ApplicationController

  def new
    @amount = params[:amount] || 2000
  end

  def create
    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params[:amount],
      currency: 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end

    # https://stripe.com/docs/stripe.js#collecting-bank-account-details
    # separate form and route for this
    recipient = Stripe::Recipient.create(
      :name => "John Doe",
      :type => "individual",
      :email => "payee@example.com",
      :bank_account => token
    )

    transfer = Stripe::Transfer.create(
      :amount => params[:amount],
      :currency => 'usd',
      :recipient => params[:recipient_id]
      )

  end

end