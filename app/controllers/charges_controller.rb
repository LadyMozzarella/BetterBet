class ChargesController < ApplicationController
  def create
    goal = Goal.find(params[:goal_id])
    amount = goal.bet_in_cents
    recipient = goal.find_recipient
    transfer = Stripe::Transfer.create(
      :amount => amount,
      :currency => "usd",
      :recipient => recipient,
      :description => "Better Bet money transfer"
    )

    goal.update_attributes(transfer_id: transfer.id)

    flash[:notice] = "Money successfully transferred!"
    redirect_to root_path

  end
end