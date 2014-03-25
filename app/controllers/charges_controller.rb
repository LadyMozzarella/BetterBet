class ChargesController < ApplicationController
  def create
    amount = Goal.find(params[:id]).bet_in_cents
    recipient = Goal.find(params[:id]).find_recipient
    transfer = Stripe::Transfer.new(
      :amount => amount,
      :currency => "usd",
      :recipient => recipient,
      :description => "Better Bet money transfer"
    )

    if transfer.save
      redirect_to root_path
    else
      redirect_to goal_path(params[:id])
    end
  end
end