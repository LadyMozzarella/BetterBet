class Payment
  def self.create(customer_id, amount = 50)
    Stripe::Charge.create(
      amount: amount,
      currency: "usd",
      customer: customer_id
    )
  end
end