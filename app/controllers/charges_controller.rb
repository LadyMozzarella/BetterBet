class ChargesController < ApplicationController

  def new
  end

  def create

    p params

  # customer = Stripe::Customer.create(
  #   email: 'exampleemail',
  #   card: params[:stripeToken]
  #   )

  # charge = Stripe::Charge.create(
  #   customer: customer.id,
  #   amount: params[:amount],
  #   currency: 'usd'
  #   )

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to charges_path
  end

end